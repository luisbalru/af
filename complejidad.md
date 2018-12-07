## COMPLEJIDAD ASINTÓTICA

### Introducción. Representación de polinomios: Representación mediante coeficientes y representación punto-valor

En esta pequeña introducción se presentan dos formas de representar polinomios: por medio de sus coeficientes y por parejas punto-valor (un punto y su evaluación en el polinomio). Atacaremos el problema de multiplicar polinomios de grado acotado por $n$, consiguiendo, a través de FFT, un algoritmo de orden $O(nlgn)$.  

#### Representación mediante coeficientes

La representación mediante coeficientes de un polinomio $A(x) = \Sum_{j=0}^{n-1} a_j x^j$ de grado acotado por $n$ es un vector de coeficientes $a=(a_0,a_1,...,a_{n-1}). Esta representación es interesante para ciertas operaciones tales como la **evaluación** (mediante la regla de Horner, tomando un tiempo $O(n)$) o la suma de polinomios, ya que si

$$a=(a_0,a_1,...,a_{n-1}),b=(b_0,b_1,...,b_{n-1}) \Rightarrow c = (c_0,c_1,...,c_{n-1}): c_j = a_j+b_j$$

calculándose en un tiempo de $O(n)$.  

Sin embargo, si se considera la multiplicación entre dos polinomios $A(x)$ y $B(x)$ de grado menor o igual que n a través de la representación mediante coeficientes, aplicando la propiedad distributiva del producto respecto de la suma (convolución de los coeficientes), el tiempo necesario asciende a $O(n^2)$, siendo muy costoso. Como la multiplicación de polinomios y el cálculo de convoluciones es una cuestión fundamental en este trabajo, es necesario encontrar alternativas más eficientes.

#### Representación punto-valor

La representación punto valor de un polinomio $A(x), degree(A) \leq n$ es un conjunto de n pares punto-valor

$$\{(x_0,y_0),(x_1,y_1),...,(x_{n-1},y_{n-1})\}$$

de forma que cada $x_k$ es distinto y $y_k = A(x_k)$ para $k=0,1,...n-1$  

El cálculo de la representación punto-valor de un polinomio dado en su representación mediante coeficientes es inmediata ya que basta con seleccionar $n$ puntos distintos $x_0,x_1,...,x_{n-1}$ y evaluarlos en $A(x)$. Con la regla de Horner, esa evaluación es del orden de $O(n^2)$ Veremos que si se seleccionan los $x_k$ cuidadosamente el algoritmo se acelera hasta $O(nlgn)$.  

Determinar los coeficientes de un polinomio dado en su representación punto-valor es un proceso llamado **interpolación**. El siguiente teorema asegura que la interpolación es una operación bien definida.  

:::{.theorem #thm:interpolación}
Para todo conjunto $\{(x_0,y_0),...,(x_{n-1},y_{n-1})\}$ de $n$ parejas punto-valor con $x_k$ distintos para todo $k$, existe un único polinomio $$A(x), degree(A) \leq n  : y_k = A(x_k) \hspace{0.5cm} \forall k = 0,...,n-1$$
:::
:::{.proof}
La ecuación $y(x_k) = A(x_k)$ es equivalente a la siguiente expresión:

\[
A = \begin{bmatrix} 
    1 & x_0 & x_0^2 \dots & x_0^{n-1} \\
    1 & x_1 & x_1^2 \dots & x_1^{n-1} \\
    \vdots & \vdots & \vdots \ddots &  \vdots \\
    1 & x_{n-1} & x_{n-1}^2 \dots & x_{n-1}^{n-1} 
    \end{bmatrix} 
    \begin{bmatrix}
    	a_0 \\
    	a_1 \\
    	\vdots \\
    	a_{n-1}
    \end{bmatrix} = 
    \begin{bmatrix}
    	y_0 \\
    	y_1 \\
    	\vdots \\
    	y_{n-1}
    \end{bmatrix}
\]

La matriz de la izquierda es conocida como la matriz de Vandermonde y sabemos que su determinante es
\[
	\prod_{0 \leq j < k \leq n-1} (x_k-x_j)
\]
y como cada punto es distinto, la matriz es invertible. Por tanto,
$$a = V(x_0,x_1,...,x_{n-1})^{-1}y$$
:::

Esta representación es conveniente tanto en sumas como en multiplicación de polinomios, obteniéndose en un tiempo $O(n)$. Sin embargo, hay que tener en cuenta que si $A,B$ son polinomios de grado menor o igual que n y $C=A+B$, entonces $degree(C)= degree(A) + degree(B)$, luego C es un polinomio de grado menor o igual que 2n. Para interpolar el polinomio de acuerdo al teorema anterior se necesitan $2n$ parejas punto-valor, por lo que hay que utilizar representaciones extendidas de cada conjunto de parejas de forma que cada uno contenga $2n$ parejas. Dados dos polinomios con su representación punto-valor extendida, se comprueba que el tiempo necesario para multiplicarlos es del orden de $O(n)$, mucho más rápido que el tiempo necesario para multiplicarlos a través de sus coeficientes.

#### Multiplicación rápida de polinomios en forma de coeficientes

¿Es posible utilizar el método de multiplicación de polinomios en su forma punto-valor (tiempo lineal) para acelerar la multiplicación a través de los coeficientes? La respuesta a esta pregunta pasa por analizar nuestra habilidad de evaluar e interpolar polinomios rápidamente.  

En principio se podría utilizar cualquier conjunto de puntos para evaluarse, pero seleccionándolos cuidadosamente, podríamos pasar de una representación a otra en tiempo $O(nlgn)$. Si tomamos las raíces complejas de la unidad como puntos a evaluar, podemos generar la representación punto valor con la Transformada Discreta de Fourier (DFT)  de un polinomio dado por sus coeficientes. Como veremos a continuación, la Transformada Rápida de Fourier (FFT) llevará a cabo la DFT y la DFT inversa en tiempo $O(nlgn)$.  

Dada la FFT, presentamos el siguiente procedimiento de orden de complejidad $O(nlgn)$ para multiplicar dos polinomios $A(x), B(x)$ de grado menor o igual que n suponiendo que estén en su representación mediante coeficientes. Podemos asumir sin pérdida de generalidad que $n$ es potencia de 2 (esto siempre se puede conseguir añadiendo coeficientes que sean 0).

\begin{enumerate}
	\item[Extendiendo al doble el grado] Se crea la representación de $A(x)$ y $B(x)$ como polinomios de grado menor o igual que $2n$ añadiendo $n$ 0 como coeficientes de orden mayor.  
	\item[Evaluación] Calcular la representación punto-valor de $A(x)$ y $B(x)$ de longitud $2n$ a través de la aplicación de la FFT de orden $2n$ sobre cada vector.  Esta representación contiene los valores de los dos polinomios evaluados en las $2n$ primeras raíces de la unidad.  
	\item[Multiplicación] Calcular la representación punto-valor de $C(x)=A(x)B(x)$ multiplicando los valores convenientemente. Esta representación contiene el valor de $C(x)$ en cada $2n$ raíz de la unidad.  
	\item[Interpolación] Generar los coeficientes de $C(x)$ mediante la aplicación de una FFT en $2n$ parejas punto-valor para calcular la DFT inversa.  
\end{enumerate}

Los pasos (1) y (3) son lineales y los pasos (2) y (4) son de orden $O(nlgn)$. Por tanto, tras mostrar cómo usar la FFT, habremos probado lo siguiente:

:::[.theorem #thm:FFT]
El producto de dos polinomios de grado menor o igual que n representados por sus coeficientes puede ser computado en un tiempo $O(nlgn)$ y la salida vendrá representada por sus coeficientes.
:::