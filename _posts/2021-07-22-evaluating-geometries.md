---
layout: post
title:  "evaluating molecular geometries"
date: 2021-07-22
categories: quantum chemistry
---

A typical problem in the quantum chemistry workflow is evaluating how "good" a computed geometry is against some experimental data (e.g., the geometry determined from X-ray diffraction). Despite how commonly this arises in the literature, I seldom see truly quantitative approaches to this problem. One typically sees authors say something like,

> The calculated geometry is in good agreement with the experimental one.

or tables of MAEs/MADs for *selected* bond distances and angles.[^1] This selective approach bothers me somewhat, as it biases the evaluation with *a priori* assumptions about which parameters "matter".

### "Unbiased" approach

Goal: Define an objective function (error) for comparing an experimental geometry with a calculated one. Ideally, there would be no user inputs in evaluating the objective, so as to prevent bias from entering the calculation.

My idea is this: throw away notions of *bonds*/*bond angles*/*dihedral angles* and recognize that a molecular geometry is uniquely determined by the positions of the nuclei in space. Then, the na&iuml;ve objective function might be:

$$ 	\begin{equation}
			L(d_{ij}^{\text{exp}},d_{ij}^{\text{calc}}) = {N \choose 2}^{-1}\sum_{i<j}{\frac{\left|d_{ij}^{\text{exp}}-d_{ij}^{\text{calc}}\right|}{d_{ij}^{\text{exp}}}}
		\end{equation} $$

where $d_{ij}$ is the (Euclidean) distance between atoms $i$ and $j$, and there are $N$ atoms in the molecule. This is just the mean fractional error in pairwise distances.

I call this "na&iuml;ve", let's see where it fails.

### Failure of the na&iuml;ve approach

Consider the following toy model. Take the geometry of 1,2-dichloroethane optimized at the [$r^2$SCAN-3c](https://aip.scitation.org/doi/10.1063/5.0040021)/def2-TZVP level of theory as "ground truth"; then, consider two relaxed surface scans, (i) scanning the C--C distance about its equilibrium value (151 pm), and (ii) scanning the Cl--C--C--Cl dihedral about its equilibrium value (180$^\circ$). This provides us with a set of "incorrect" geometries for which we know a good loss function, i.e. the PES. Here are the results using the "na&iuml;ve" loss:[^2]

![naive_loss](/assets/evaluating-geometries/naive_loss.svg)


A problem with this approach is manifest immediately: the shape of the loss function along the distance PES is very different from the real error. This should not be surprising, since our loss function is symmetric about $d_{ij}^{\text{exp}}$, whereas interatomic potentials are anharmonic.

Is this a problem? As long as the errors are relatively small, interatomic potentials are approximately harmonic, so we can expect the symmetric loss function to be a reasonable model. Indeed, for small relative errors (say $L\lesssim10\%$), the magnitude of the loss correlates well with the real energies:

![naive_loss_2](/assets/evaluating-geometries/naive_loss_2.svg)

However, the loss function across the dihedral PES does not seem commensurate with that across the distance PES. Maybe we can do better.

### Anharmonic oscillator

A well-known interatomic potential is due to [Philip M. Morse](https://en.wikipedia.org/wiki/Philip_M._Morse),

$$ V(r) = D_e\left( 1 - \exp[-a(r-r_e)] \right)^2 $$

Which can be thought of as an anharmonic oscillator with a harmonic force constant given by,

$$ k = 2D_ea^2 $$

$D_e$ gives the dissociation energy in the limit of infinite separation. In our contrived example, the C--C distance PES is well-described by a Morse potential with $D_e = 133.3\ \text{mHa}$ and $k = 0.1\ \text{mHa/pm}^2$.

It is therefore tempting to define our loss function in terms of pairwise Morse potentials, with $d_{ij}^{\text{exp}} = r_e$. And, indeed, in our contrived example there is an excellent correspondence between the partial loss due to the C--C distance and the actual error:

![morse-1](/assets/evaluating-geometries/morse-1.svg)

The difficulty arises in generalization. Here, we have tuned the stiffness of the oscillator to $a = 0.02$ by fitting the actual potential. While this works to parameterize the loss due to the error in the C--C distance, it (obviously) does not generalize to every other pair potential in the system:

![morse-2](/assets/evaluating-geometries/morse-2.svg)

And, in general, we do not know how to set $a$ (or, equivalently $k$) for arbitrary pairs of atoms $i,j$. Our task is thus to devise a way to programmatically define an interaction potential for two atoms given $d_{ij}^{\text{exp}}$.

### Generating pairwise Morse potentials

My intuition is this: if two atoms are close in space, they should have a stiff and steep interatomic potential ($D_e,k$ large). Conversely, if they are far away they should have a loose and shallow potential ($D_e,k$ small).

The question of how to determine "close" and "far" is somewhat ill-posed. One whats some notion of an atomic radius $r_i$ such that two atoms can be considered "close" if

$$ d_{ij}^{\text{exp}} \approx r_i + r_j $$

There is obviously quite a proliferation of atomic radii in the literature. For simplicity I will choose the single-bond covalent radii of [Pyykk&ouml;](https://chemistry-europe.onlinelibrary.wiley.com/doi/10.1002/chem.200800987); it should be a simple matter to redefine the set of radii. To use these radii, along with the reference experimental pair distances, I have in mind a function I'll call `logisticMorse`, for reasons that will become apparent (a MATLAB implementation is below):

```
%% Logistic curve to determine Morse parameters
% r_A is the radius of atom A
% r_B is the radius of atom B
% d_exp is the experimental distance
% Idea: generates a Morse potential "tuned" to d_exp

function V = logisticMorse(r_A,r_B,d_exp)
    R = r_A + r_B;
    k = 8e-4;

    f=@(x) 1./(1+exp(2.5e-2*(x-R)));
    a = sqrt(k/2*f(d_exp));
    V = morse(1e2,a,d_exp);
end
```
For a pair of atoms of radii $r_i$ and $r_j$, and an experimental distance $d_{ij}^{\text{exp}}$ (all in pm here), this function generates a Morse potential with parameters

$$
	\begin{align*}
		D_e &= 100 \\
		\tilde{k} &= 8\times10^{-4} \\
		a &= \sqrt{\frac{\tilde{k}}{2}f(d_{ij}^{\text{exp}})} \\
		r_e &= r_i + r_j \\
	\end{align*}
$$

Note that the **actual** stiffness is given by

$$ k = D_e\tilde{k}f(d_{ij}^{\text{exp}}) $$

The function $f$, hence the name `logisticMorse`, is a scaled logistic function,

$$ f(x) = \frac{1}{1+e^{0.025(x-r_e)}} $$

Let's see how this function behaves. Consider a C--C pair with experimental distances:
- 120 pm ([acetylene](https://en.wikipedia.org/wiki/Acetylene))
- 134 pm ([ethylene](https://en.wikipedia.org/wiki/Ethylene))
- 154 pm ([ethane](https://en.wikipedia.org/wiki/Ethane))
- 181 pm ([world record](https://cen.acs.org/articles/96/i11/Chemists-break-record-longest-C-C-bond.html))

The left plot below shows where the experimental distance maps on the logistic curve, while the right plot shows the resultant Morse potential. Note how the potentials get looser and looser as the C--C distance lengthens, as desired.

![logisticMorse](/assets/evaluating-geometries/logisticMorse.svg)

<hr>

[^1]: [A representative example](https://pubs.acs.org/doi/10.1021/ct200187d) of where this can be frustrating. I by no means want to indict these authors in particular, but I think this "semi-quantitative" treatment of ab initio geometries is quite typical.

[^2]: Note that the implementation of the loss function $(1)$ above that I'm using includes contributions from the C--H bonds, despite the fact that these distances are usually not accurately determined experimentally.
