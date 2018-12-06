# Convolución discreta

De manera análoga al caso continuo, en el caso discreto podemos definir una operación de convolución y un Teorema de Convolución que la relacione con la transformada de Fourier.

:::{.definition}
Dadas dos secuencias $\{x\} = x_1, \dots, x_N$, $\{y\} = y_1, \dots, y_N$ de $N$ números complejos, definimos su convolución $\{x\} \ast \{y\} := \{z\}$ como $\{z\} = z_1, \dots, z_N$, donde

$$z_k := \frac{1}{N} \sum_{n=0}^{N-1} x_n y_{k-n}$$

y $x_{k \pm N} := x_k, y_{k \pm N} := y_k$ para $0 \leq k < N$.
:::

También necesitaremos definir el producto de dos secuencias, que no es más que su producto elemento a elemento.

:::{.definition}
Dadas dos secuencias $\{x\} = x_1, \dots, x_N$, $\{y\} = y_1, \dots, y_N$ de $N$ números complejos, definimos su producto como $\{x\} \{y\} := x_0 y_0, \dots, x_{N-1} y_{N-1}$ para $0 \leq m < N$.
:::

## Teorema de Convolución

El siguiente Teorema establece una relación fundamental entre la convolución de secuencias y la DFT:  la DFT de la convolución de secuencias es el producto de sus respectivas DFT.

:::{.definition #thm:conv}
Dadas dos secuencias $\{x\} = x_1, \dots, x_N$, $\{y\} = y_1, \dots, y_N$ de $N$ números complejos periódicas (esto es, considerando $x_{k \pm N} = x_k, y_{k \pm N} = y_k$) se verifica

$$\mathcal{F}(\{x\} \ast \{y\}) = \frac{1}{N} \mathcal{F}\{x\} \mathcal{F}\{y\} \text{.}$$
:::

:::{.proof}
Llamando $\{z\} = \{x\} \ast \{y\} = z_0, \dots, z_{N-1}$, $\{Z\} = \mathcal{F}\{z\} = Z_0, \dots, Z_{N-1}$, $\{X\} = \mathcal{F} \{x\} = X_0, \dots, X_{N-1}$, $\{Y\} = \mathcal{F} \{y\} = Y_0, \dots, Y_{N-1}$, se tiene

$$\begin{split}
Z_k & = \sum_{n=0}^{N-1} z_n W_N^{kn} = \sum_{n=0}^{N-1} \left( \frac{1}{N} \sum_{m=0}^{N-1} x_m y_{n-m} \right) W_N^{kn} = \frac{1}{N} \sum_{m=0}^{N-1} \left( \sum_{n=0}^{N-1} x_m y_{n-m} W_N^{kn} \right) \\
& = \frac{1}{N} \sum_{m=0}^{N-1} \left( x_m W_N^{km} \sum_{n=0}^{N-1} y_{n-m} W_N^{k(n-m)} \right) = \frac{1}{N} \sum_{m=0}^{N-1} \left( x_m W_N^{km} \sum_{n=0}^{N-1} y_n W_N^{kn} \right) \\
& \frac{1}{N} \left( \sum_{m=0}^{N-1} x_m W_N^{km} \right) \left( \sum_{n=0}^{N-1} y_n W_N^{kn} \right) = X_k Y_k \text{,}\\
\end{split}$$

lo que concluye la prueba.
:::
