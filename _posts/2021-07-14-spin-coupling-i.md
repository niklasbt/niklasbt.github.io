---
layout: post
title:  "Coupling angular momenta. Part i."
date: 2021-07-14
categories: spin coupling
---

*The following is part of a series of notes I prepared to teach graduate students at MIT the basics of coupling quantum-mechanical angular momenta during the lockdown of 2020.*

### Mathematical Background

#### Basic concepts
We will deal with `sets` and their elements; axiomatically, a set $A$ is a collection of objects. We denote that an object $a$ is a member or element of $A$ by writing $a \in A$. (E.g., the set of natural numbers $\mathbb{N}$ contains the integer 1, but not 0, i.e. $1 \in \mathbb{N}$ but $0 \notin \mathbb{N}$.) Given two sets, $A$ and $B$, we can define a correspondence or mapping of elements $a \in A$ to elements $b \in B$, such that each element $a$ is mapped uniquely to an element $b$. Such a map is called a `function`, and is denoted $f:A \to B$. We also write for $a \in A$, $a \mapsto f(a)$ for $f(a) \in B$ to denote that the element $a$ is mapped to $f(a)$ under the action of $f$. An important set for us will be the set of complex numbers, denoted $\mathbb{C}$.

An important concept, which is developed further below, is how sets can be used to construct new sets. One straightforward way to do this is, given two sets $A$ and $B$, to define a new set composed of all ordered pairs $(a,b)$ of elements $a \in A$ and $b \in B$. This new set is called the `Cartesian or direct product` and is denoted,
	\begin{equation}
		A \times B \equiv \{(a,b)\mid a \in A \text{ and } b\in B\}
	\end{equation}
The familiar example is the construction of the Euclidean plane by taking the direct product of the real numbers with itself, $\mathbb{R}^2 \equiv \mathbb{R}\times\mathbb{R}$.

Sometimes, as below, we will take liberties with notation, if it is clear in context. For example, one can consider addition of elements of $\mathbb{N}$ to be a map $+:\mathbb{N}\times\mathbb{N}\to\mathbb{N}$ such that for $a,b\in\mathbb{N}$ we write $+(a,b) \equiv a + b$.

#### Complex vector spaces
The types of sets that are the concern of quantum mechanics are built up from vector spaces (more specifically the structure of a Hilbert space). A \textbf{complex vector space} is a collection of elements ${v} \in V$ and two maps $+:V\times V \to V$ and $\cdot: \mathbb{C}\times V\to V$ that satisfies:
	\begin{align}
		&\forall\ {v_1},{v_2} \in V,\ {v_1} + {v_2} \in V \text{ (\textit{closure})} \\
		&\forall\  {v_1},{v_2},{v_3} \in V,\ ({v_1} + {v_2}) + {v_3} = {v_1} + ({v_2} + {v_3}) \text{ (\textit{associativity})}\\
		&\forall\  {v_1},{v_2} \in V,\ {v_1} + {v_2} = {v_2} + {v_1} \text{ (\textit{commutativity})} \\
		&\exists\  {0} \in V, \text{ such that } \forall\ {v} \in V,\ {v} + {0} = {v} \text{ (\textit{identity})} \\
		&\forall\ {v} \in V,\ \exists\ {-v} \in V \text{ such that } {v} + ({-v}) = {0} \text{ (\textit{additive inverses})}
	\end{align}
and,
