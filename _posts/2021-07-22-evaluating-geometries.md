---
layout: post
title:  "evaluating molecular geometries"
date: 2021-07-22
categories: quantum chemistry
---

A typical problem in the quantum chemistry workflow is evaluating how "good" a computed geometry is against some experimental data (e.g., the geometry determined from X-ray diffraction). Despite how commonly this arises in the literature, I seldom see truly quantitative approaches to this problem. One typically sees authors say something like,

> The calculated geometry is in good agreement with the experimental one.

Or tables of MAEs/MADs for *selected* bond distances and angles.[^1] This selective approach bothers me somewhat, as it biases the evaluation with *a priori* assumptions about which parameters "matter".

### "Unbiased" approach

Goal: Define an objective function (error) for comparing an experimental geometry with a calculated one. Ideally, there would be no user inputs in evaluating the objective, so as to prevent bias from entering the calculation.

My idea is this: throw away notions of *bonds*/*bond angles*/*dihedral angles* and recognize that a molecular geometry is uniquely determined by the positions of the nuclei in space. Then, the na&iuml;ve objective function might be:

$$ 	\begin{equation}
			L(d_{ij}^{\text{exp}},d_{ij}^{\text{calc}}) = {N \choose 2}^{-1}\sum_{i<j}{\frac{\left|d_{ij}^{\text{exp}}-d_{ij}^{\text{calc}}\right|}{d_{ij}^{\text{exp}}}}
		\end{equation} $$

where $d_{ij}$ is the (Euclidean) distance between atoms $i$ and $j$, and there are $N$ atoms in the molecule. This is just the mean fractional error in pairwise distances.

I call this "na&iuml;ve", let's see where it fails.

### Failure of the na&iuml;ve approach

[^1]: [A representative example](https://pubs.acs.org/doi/10.1021/ct200187d) of where this can be frustrating. I by no means want to indict these authors in particular, but I think this "semi-quantitative" treatment of ab initio geometries is quite typical.
