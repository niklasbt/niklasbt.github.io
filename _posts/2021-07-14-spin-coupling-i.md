---
layout: post
title:  "Coupling angular momenta. Part i."
date: 2021-07-14
categories: spin coupling
---

*The following is part of a series of notes I prepared to teach graduate students at MIT the basics of coupling quantum-mechanical angular momenta during the lockdown of 2020.*

### Mathematical Background

#### Basic concepts
We will deal with `sets` and their elements; axiomatically, a set $A$ is a collection of objects. We denote that an object $a$ is a member or element of $A$ by writing $a \in A$. (E.g., the set of natural numbers $\mathbb{N}$ contains the integer 1, but not 0, i.e. $1 \in \mathbb{N}$ but $0 \notin \mathbb{N}$.) Given two sets, $A$ and $B$, we can define a correspondence or mapping of elements $a \in A$ to elements $b \in B$, such that each element $a$ is mapped uniquely to an element $b$. Such a map is called a `function`, and is denoted $f:A \to B$. We also write for $a \in A$, $$a \mapsto f(a)$$ for $f(a) \in B$ to denote that the element $a$ is mapped to $f(a)$ under the action of $f$. An important set for us will be the set of complex numbers, denoted $\mathbb{C}$.

An important concept, which is developed further below, is how sets can be used to construct new sets. One straightforward way to do this is, given two sets $A$ and $B$, to define a new set composed of all ordered pairs $(a,b)$ of elements $a \in A$ and $b \in B$. This new set is called the `Cartesian or direct product` and is denoted,

	\begin{equation}
		A \times B \equiv \{(a,b)\mid a \in A \text{ and } b\in B\}
	\end{equation}

	\[ A \times B \equiv \{(a,b)\mid a \in A \text{ and } b\in B\} \]

	\[
		a^2 = 0
	\]

	$$ a^2 = 0 $$

$$ \begin{equation} a^2 = 0 \end{equation} $$

The familiar example is the construction of the Euclidean plane by taking the direct product of the real numbers with itself, $\mathbb{R}^2 \equiv \mathbb{R}\times\mathbb{R}$.

Sometimes, as below, we will take liberties with notation, if it is clear in context. For example, one can consider addition of elements of $\mathbb{N}$ to be a map $+:\mathbb{N}\times\mathbb{N}\to\mathbb{N}$ such that for $a,b\in\mathbb{N}$ we write $+(a,b) \equiv a + b$.

#### Complex vector spaces
The types of sets that are the concern of quantum mechanics are built up from vector spaces (more specifically, [Hilbert spaces](https://en.wikipedia.org/wiki/Hilbert_space)). A `complex vector space` is a collection of elements $v \in V$ and two maps $+:V\times V \to V$ and $\cdot: \mathbb{C}\times V\to V$ that satisfies:

	$$ \begin{align} &\forall\ v_1,v_2 \in V,\ v_1 + v_2 \in V  \\ &\forall\  v_1,v_2,{v_3} \in V,\ (v_1 + v_2) + {v_3} = v_1 + (v_2 + {v_3}) \\ &\forall\  v_1,v_2 \in V,\ v_1 + v_2 = v_2 + v_1  \\ &\exists\  0 \in V, \text{ such that } \forall\ v \in V,\ v + 0 = v  \\ &\forall\ v \in V,\ \exists\ {-v} \in V \text{ such that } v + ({-v}) = 0 \end{align} $$

and,
$$ \begin{align}
	&\forall\ \alpha\in\mathbb{C},\ v \in V,\ \alpha\cdot{v} \in V \\
	&\forall\ \alpha\in\mathbb{C},\ v_1,v_2 \in V,\ \alpha\cdot(v_1 + v_2) = \alpha\cdot{v}_1 + \alpha\cdot{v}_1 \\
	&\forall\ \alpha,\beta\in\mathbb{C},\ v \in V,\ (\alpha+\beta)\cdot{v} = \alpha\cdot{v} + \beta\cdot{v} \\
	&\forall\ \alpha,\beta\in\mathbb{C},\ v \in V,\ (\alpha\beta)\cdot{v} = \alpha\cdot(\beta\cdot{v}) \\
	&\forall\ v \in V,\ 1\in\mathbb{C},\ 1\cdot{v} = v\
	\end{align} $$

The function $(v_1,v_2)\mapsto v_1 + v_2$ is just addition in the normal sense, while $(\alpha,v)\mapsto \alpha\cdot{v}$ is called `scalar multiplication`.

**Exercise:** Show that for $0 \in \mathbb{C}$, $0\cdot{v} = 0$ for all $v \in V$.

A standard example of a (real) vector space is again $\mathbb{R}^2$; the vectors are the ordered pairs $(a,b)$ while the scalars are simply the real numbers. We now introduce two central concepts to the algebra of vector spaces. The first is the idea of linear independence, and the second is the idea of a basis:

> **Linear independence:** Let $\{v_1,v_1,\dots v_m\},$ be nonzero vectors in $V$. Then this set is called linearly independent if $\forall\ \alpha_1,\dots,\alpha_m \in \mathbb{C}$ such that $$ \begin{equation*} \alpha_1v_1+\dots+\alpha_mv_m = 0 \end{equation*} $$ we have $\alpha_1 = \alpha_2 = \dots = \alpha_m = 0$.

The term `independence` in this sense means that no vector in the set $\{v_m\}$ can be expressed in terms of any other vector in the set. A linearly dependent set of vectors is simply one that is not linearly independent. Now we define the idea of a spanning set and a basis:

> **Spanning sets and bases:** Let $S = \{v_1,v_2,\dots v_m\}$, be a set of vectors in $V$. The *span* of $S = \{ \sum_{i=1}^m{\alpha_iv_i} | \alpha_i \in \mathbb{C} \}$ Denote this subset of $V$ by $\text{span} \ {S}$. If $\text{span} \ {S} = V$ then $S$ is called a *spanning set* for V. A spanning set is called a *basis* if it is also linearly independent.

The following are some important theorems regarding the properties of bases. The key take away will be that, if a vector space has a finite basis, say with $n$ elements, then we know that any basis will have $n$ elements. Moreover, this provides a definition for the `dimension` of a vector space. Later, we will be considering only `finite dimensional vector spaces`, which can be defined as those vector spaces which possess finite spanning sets.

>**Lemma:** Let $\{v_1,v_2,\dots {v_n}\}$ be a linearly dependent set of vectors in $V$. Then there exists $k$ such that $1 < k \leq n$ such that ${v_k}$ is a linear combination of $v_1,\dots {v_{k-1}}$.

>**Exchange lemma:** Let $U = \{u_1,u_2,\dots {u_m}\}$ be a spanning set for the vector space $V$. Then if $\{v_1,v_2,\dots {v_n}\}$ is a linearly independent set of vectors in $V$, $n \leq m$.

>**Corollary:** Let $V$ be a finite dimensional vector space. Then $V$ has a finite basis.

>**Theorem:** If $V$ is a finite dimensional vector space, then any two bases of $V$ have the same number of elements.

We are now in a position to define the dimension of a finite dimensional vector space: suppose $V$ is a vector space containing a basis with $n$ elements. Then the `dimension` of $V$ is $n$, denoted by $\dim{V} = n$. If $V = \{0\}$ we set $\dim{V} = 0$.

>**Theorem:** Let $V$ be an $n$-dimensional vector space and let $\{v_1,v_2,\dots v_m\}$ be a set of linearly independent vectors. Then $m \leq n$ and there exists at set of vectors $v_{m+1},\dots,{v_n}$ such that $\{v_1,\dots v_m,v_{m+1},\dots,{v_n}\}$ is a basis for $V$.

This last theorem is very powerful. It says that we can always take a set of linearly independent vectors and "complete" it to form a basis.
