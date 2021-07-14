---
layout: post
title:  "coupling angular momenta. part i."
categories: spin coupling
---
## 1. Mathematical Background

### Basic concepts
We will deal with ``sets'' and their elements; axiomatically, a set $A$ is a ``collection'' of objects. We denote that an object $a$ is a member or element of $A$ by writing $a \in A$. (E.g., the set of natural numbers $\mathbb{N}$ contains the integer 1, but not 0, i.e. $1 \in \mathbb{N}$ but $0 \notin \mathbb{N}$.) Given two sets, $A$ and $B$, we can define a correspondence or mapping of elements $a \in A$ to elements $b \in B$, such that each element $a$ is mapped uniquely to an element $b$. Such a map is called a \textbf{function}, and is denoted $f:A \to B$. We also write for $a \in A$, $a \mapsto f(a)$ for $f(a) \in B$ to denote that the element $a$ is mapped to $f(a)$ under the action of $f$. An important set for us will be the set of complex numbers, denoted $\mathbb{C}$.

An important concept, which is developed further below, is how sets can be used to construct new sets. One straightforward way to do this is, given two sets $A$ and $B$, to define a new set composed of all ordered pairs $(a,b)$ of elements $a \in A$ and $b \in B$. This new set is called the \textbf{Cartesian or direct product} and is denoted,
	\begin{equation}
		A \times B \equiv \{(a,b)\mid a \in A \text{ and } b\in B\}
	\end{equation}
The familiar example is the construction of the Euclidean plane by taking the direct product of the real numbers with itself, $\mathbb{R}^2 \equiv \mathbb{R}\times\mathbb{R}$.

Sometimes, as below, we will take liberties with notation, if it is clear in context. For example, one can consider \textit{addition} of elements of $\mathbb{N}$ to be a map $+:\mathbb{N}\times\mathbb{N}\to\mathbb{N}$ such that for $a,b\in\mathbb{N}$ we write $+(a,b) \equiv a + b$. Henceforth, numbers (scalars) will be denoted with normal-weight typeface, vectors will be denoted with lowercase bold-weight typeface, and vector spaces will be denoted with uppercase typeface (\textit{vide infra}). Later we will introduce Dirac (bra--ket) notation for vectors.

## Complex vector spaces
The types of sets that are the concern of quantum mechanics are built up from vector spaces (more specifically the structure of a Hilbert space). A \textbf{complex vector space} is a collection of elements $\bm{v} \in V$ and two maps $+:V\times V \to V$ and $\cdot: \mathbb{C}\times V\to V$ that satisfies:
	\begin{align}
		&\forall\ \bm{v_1},\bm{v_2} \in V,\ \bm{v_1} + \bm{v_2} \in V \text{ (\textit{closure})} \\
		&\forall\  \bm{v_1},\bm{v_2},\bm{v_3} \in V,\ (\bm{v_1} + \bm{v_2}) + \bm{v_3} = \bm{v_1} + (\bm{v_2} + \bm{v_3}) \text{ (\textit{associativity})}\\
		&\forall\  \bm{v_1},\bm{v_2} \in V,\ \bm{v_1} + \bm{v_2} = \bm{v_2} + \bm{v_1} \text{ (\textit{commutativity})} \\
		&\exists\  \bm{0} \in V, \text{ such that } \forall\ \bm{v} \in V,\ \bm{v} + \bm{0} = \bm{v} \text{ (\textit{identity})} \\
		&\forall\ \bm{v} \in V,\ \exists\ \bm{-v} \in V \text{ such that } \bm{v} + (\bm{-v}) = \bm{0} \text{ (\textit{additive inverses})}
	\end{align}
and,
	\begin{align}
		&\forall\ \alpha\in\mathbb{C},\ \bm{v} \in V,\ \alpha\cdot\bm{v} \in V \\
		&\forall\ \alpha\in\mathbb{C},\ \bm{v_1},\bm{v_2} \in V,\ \alpha\cdot(\bm{v_1} + \bm{v_2}) = \alpha\cdot\bm{v_1} + \alpha\cdot\bm{v_1} \label{linear1} \\
		&\forall\ \alpha,\beta\in\mathbb{C},\ \bm{v} \in V,\ (\alpha+\beta)\cdot\bm{v} = \alpha\cdot\bm{v} + \beta\cdot\bm{v} \label{linear2}\\
		&\forall\ \alpha,\beta\in\mathbb{C},\ \bm{v} \in V,\ (\alpha\beta)\cdot\bm{v} = \alpha\cdot(\beta\cdot\bm{v}) \label{assoc}\\
		&\text{For } 1\in\mathbb{C},\ 1\cdot\bm{v} = \bm{v}\ \forall\ \bm{v} \in V
	\end{align}
The function $(\bm{v_1},\bm{v_2})\mapsto \bm{v_1} + \bm{v_2}$ is just addition in the normal sense, while $(\alpha,\bm{v})\mapsto \alpha\cdot\bm{v}$ is called \textbf{scalar multiplication}. Equations \ref{linear1} and \ref{linear2} define what it means for this multiplication to have \textit{linearity}, while \ref{assoc} allows it to be associative. \\

\centerline{\textbf{Exercise:} Show that for $0 \in \mathbb{C}$, $0\cdot\bm{v} = \bm{0}$ for all $\bm{v} \in V$.}

A standard example of a (real) vector space is again $\mathbb{R}^2$; the vectors are the ordered pairs $(a,b)$ while the scalars are simply the real numbers. We now introduce two central concepts to the algebra of vector spaces. The first is the idea of linear independence, and the second is the idea of a basis:

\textbf{Linear independence:} Let $\{\bm{v_1},\bm{v_1},\dots \bm{v_m}\},$ be nonzero vectors in $V$. Then this set is called linearly independent if $\forall\ \alpha_1,\dots,\alpha_m \in \mathbb{C}$ such that
	\begin{equation*}
		\alpha_1\bm{v_1}+\dots+\alpha_m\bm{v_m} = \bm{0}
	\end{equation*}
we have $\alpha_1 = \alpha_2 = \dots = \alpha_m = 0$.

The term \textit{independence} in this sense means that no vector in the set $\{\bm{v_m}\}$ can be expressed in terms of any other vector in the set. A linearly dependent set of vectors is simply one that is not linearly independent. Now we define the idea of a spanning set and a basis:

\textbf{Spanning sets and bases:} Let $S = \{\bm{v_1},\bm{v_2},\dots \bm{v_m}\}$, be a set of vectors in $V$. The \textbf{span} of $S$ is the set of all vectors $\bm{v} \in V$ such that $\exists$ a set of scalars $\alpha_1,\dots,\alpha_m \in \mathbb{C}$ such that
	\begin{equation*}
		\bm{v} = \sum_{i = 1}^m{\alpha_i\bm{v_i}}
	\end{equation*}
and denote this subset of $V$ by $\spn{S}$. If $\spn{S} = V$ then $S$ is called a \textbf{spanning set} for V. A spanning set is called a \textbf{basis} if it is also linearly independent.

The following are some important theorems regarding the properties of bases. The key take away will be that, if a vector space has a finite basis, say with $n$ elements, then we know that \textit{any} basis will have $n$ elements. Moreover, this provides a definition for the dimension of a vector space. Later, we will be considering only \textbf{finite dimensional vector spaces}, which can be defined as those vector spaces which possess finite spanning sets.

\textbf{Lemma:} Let $\{\bm{v_1},\bm{v_2},\dots \bm{v_n}\}$ be a linearly dependent set of vectors in $V$. Then there exists $k$ such that $1 < k \leq n$ such that $\bm{v_k}$ is a linear combination of $\bm{v_1},\dots \bm{v_{k-1}}$.

\textbf{Exchange lemma:} Let $U = \{\bm{u_1},\bm{u_2},\dots \bm{u_m}\}$ be a spanning set for the vector space $V$. Then if $\{\bm{v_1},\bm{v_2},\dots \bm{v_n}\}$ is a linearly independent set of vectors in $V$, $n \leq m$.

\textbf{Corollary:} Let $V$ be a finite dimensional vector space. Then $V$ has a finite basis.

\textbf{Theorem:} If $V$ is a finite dimensional vector space, then any two bases of $V$ have the same number of elements.
	\begin{quote}\begin{proof}
		Let $\{\bm{v_1},\bm{v_2},\dots \bm{v_n}\}$ and $\{\bm{u_1},\bm{u_2},\dots \bm{u_m}\}$ be two bases for $V$. Then by the exchange lemma, $n \leq m$ and $m \leq n$.
	\end{proof}\end{quote}

We are now in a position to define the dimension of a finite dimensional vector space: suppose $V$ is a vector space containing a basis with $n$ elements. Then the \textbf{dimension} of $V$ is $n$, denoted by $\dim{V} = n$. If $V = \{\bm{0}\}$ we set $\dim{V} = 0$.

\textbf{Theorem:} Let $V$ be an $n$-dimensional vector space and let $\{\bm{v_1},\bm{v_2},\dots \bm{v_m}\}$ be a set of linearly independent vectors. Then $m \leq n$ and there exists at set of vectors $\bm{v_{m+1}},\dots,\bm{v_n}$ such that $\{\bm{v_1},\dots \bm{v_m},\bm{v_{m+1}},\dots,\bm{v_n}\}$ is a basis for $V$.

This last theorem is very powerful. It says that we can always take a set of linearly independent vectors and ``complete'' it to form a basis.
