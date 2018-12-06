# Definiciones

A continuación definiremos la transformada discreta de Fourier o DFT (por *discrete Fourier Transform*) y la trasformada discreta de Fourier inversa o IDFT (por *inverse discrete Fourier Transform*).

:::{.definition}
Dada una secuencia $\{x\}=x_0, \dots, x_{N-1}$ de $N$ números complejos, definimos su *transformada discreta de Fourier* $\mathcal{F} \colon \mathbb{C}^N \to \mathbb{C}^N$ como $\mathcal{F}\{x\}= X_0, \dots, X_{N-1}$, donde

$$X_k := \sum_{n=0}^{N-1} x_n e^{\frac{-2 \pi ikn}{N}}$$

para $0 \leq k < N$.

Para mayor brevedad notaremos $W_N := e^{\frac{-2 \pi i}{N}}$, resultando

$$X_k = \sum_{n=0}^{N-1} x_n W_N^{kn} \text{.}$$
:::

:::{.definition}
Dada una secuencia $\{X\}=X_0, \dots, X_{N-1}$ de $N$ números complejos, definimos su *transformada discreta de Fourier inversa* $\mathcal{F}^{-1} \colon \mathbb{C}^N \to \mathbb{C}^N$ como $\mathcal{F}^{-1}\{X\}= x_0, \dots, x_{N-1}$, donde

$$x_k := \frac{1}{N} \sum_{n=0}^{N-1} X_n W_N^{-kn}$$

para $0 \leq k < N$.
:::

## DFT normalizada

En ocasiones conviene usar versiones de la DFT y la IDFT normalizadas o unitarias, esto es, que definan una isometría. Para ello solo tenemos que multiplicar la DFT y la IDFT por una constante de normalización. De esa manera llegamos a las siguientes definiciones:

:::{.definition}
Dada una secuencia $\{x\}=x_0, \dots, x_{N-1}$ de $N$ números complejos, definimos su *transformada discreta de Fourier normalizada* $\operatorname{UDT} \colon \mathbb{C}^N \to \mathbb{C}^N$ como $\operatorname{UDT}\{x\}= X_0, \dots, X_{N-1}$, donde

$$X_k := \frac{1}{\sqrt{N}} \sum_{n=0}^{N-1} x_n W_N^{kn}$$

para $0 \leq k < N$.
:::

:::{.definition}
Dada una secuencia $\{X\}=X_0, \dots, X_{N-1}$ de $N$ números complejos, definimos su *transformada discreta de Fourier inversa normalizada* $\operatorname{UDT}^{-1} \colon \mathbb{C}^N \to \mathbb{C}^N$ como $\operatorname{UDT}^{-1}\{X\}= x_0, \dots, x_{N-1}$, donde

$$x_k := \frac{1}{\sqrt{N}} \sum_{n=0}^{N-1} X_n W_N^{-kn}$$

para $0 \leq k < N$.
:::
