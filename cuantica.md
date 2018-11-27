# La transformada de Fourier cuántica

## Introducción

TODO Qué es la computación cuántica

TODO Qué es la transformada de Fourier cuántica y cuáles son sus limitaciones.

TODO Qué es el problema del subgrupo abeliano y sus aplicaciones.

## TODO Intro a complejidad

No sé si debería ir aquí

## Principios de la mecánica cuántica

El modelo habitual de ordenadores cuánticos viene dado por un sistema cuántico aislado en el que se permiten algunas operaciones básicas dadas por transformaciones unitarias. En esta sección describimos los principios de mecánica cuántica que utilizamos para definir nuestro modelo.

La implementación concreta de los ordenadores cuánticos requiere de un proceso de corrección de errores ya que los sistemas cuánticos no son aislados. Existen resultados que nos garantizan que podemos realizar esa corrección de errores de forma eficiente (polinomial) si el ruido del sistema no supera un cierto umbral[TODO cita].

### Espacio de estados

En primer lugar definimos el espacio de estados de un sistema cuántico:

:::{.principle}
El *espacio de estados* de un sistema cuántico (aislado) es el espacio proyectivo asociado a un espacio de Hilbert complejo y separable. Es decir, los estados de un sistema cuántico se identifican con los subespacios de dimensión 1 (*rayos*) de un espacio de Hilbert complejo separable.
:::

La computación cuántica se restringe tradicionalmente a sistemas cuánticos de dimensión finita, por lo que podemos tomar como espacio de estados canónico $\mathbb{P}\mathbb{C}^N$. Habitualmente, en lugar de trabajar en el espacio proyectivo escogemos un representante de norma 1 de cada rayo (*vector de estado*). El vector de estado de un rayo es único salvo constante de la forma $e^{i\theta} (\theta \in \mathbb{R})$.

Utilizamos la notación habitual en mecánica cuántica, en la que los vectores del espacio de Hilbert se representan por *kets* de la forma $\ket{\psi}, \ket{\psi}$. Cada ket tiene asociado un *bra*, que en el caso finito podemos identificar con su adjunto conjugado $\bra{\psi} = \ket{\psi}^\dagger$. De esta forma el producto escalar se define $$(\ket{\psi},\ket{\phi}) := \bk{\psi}{\phi} := \ket{\psi}^\dagger \ket{\phi}.$$

Un **qubit** es un sistema cuántico con espacio de estados de dimensión 2.
Dado un qubit fijamos una base ortonormal $(\ket{0},\ket{1})$. El término se utiliza también para referirse a un estado concreto; utilizando la identificación con representantes de norma 1 tenemos que un qubit es por tanto un vector $$\ket{\psi} = \alpha \ket{0} + \beta \ket{1} \text{ tal que } \norm{\ket{\psi}} = |\alpha|^2 + |\beta|^2 = 1.$$

### Sistemas compuestos 

Aunque podemos considerar otros tipos de sistemas cuánticos, en computación cuántica nos restringimos a sistemas compuestos por qubits. Esta restricción no supone ningún cambio en términos de qué problemas pueden resolverse en tiempo polinomial en un ordenador cuántico[TODO cita]. 

El espacio de estados de un sistema compuesto viene dado por el producto tensorial. 
Exponemos brevemente la construcción de un espacio de Hilbert a partir del producto tensorial de dos espacios de Hilbert.

:::{.proposition}
Sean $H_1, H_2$ espacios de Hilbert con bases ortonormales $B_1 = \{u_i\}_{i \in I}, B_2 = \{v_j\}_{j \in J}$. Entonces el producto tensorial de $H_1, H_2$ como espacios vectoriales  tiene estructura de espacio de Hilbert con producto escalar dado por la extensión lineal de
$$\bk{u \otimes v}{u' \otimes v'} = \bk{u}{u'} \bk{v}{v'}$$
y $B_1 \otimes B_2 := \{u_i \otimes v_j\}_{(i,j)}$ es una base ortonormal.
:::
:::{.proof}

:::

De esta forma está justificado el siguiente principio:

:::{.principle}
El espacio de estados de un sistema compuesto es el espacio proyectivo asociado al producto tensorial de los espacios de Hilbert de sus subsistemas.
:::

Siguiendo la notación habitual escribiremos $\ket{\phi \psi} := \ket{\phi} \otimes \ket{\psi}$.
El vector de estado asociado a un rayo de un sistema compuesto es el producto tensorial de los vectores de estado de sus subsistemas.

Un sistema de $n$ qubits tiene un espacio de estados de dimensión $N = 2^n$.
Fijamos como base ortonormal de un sistema compuesto de $n$ qubits la base obtenida en la [prop TODO].
Como cada qubit $Q_i$ tiene una base ortonormal fijada $\ket{0}_i, \ket{1}_i$ los elementos de esta base son de la forma: $$\ket{a_0\dots a_{n-1}} := \ket{a_0} \otimes \cdots \otimes \ket{a_{n-1}} \qquad (a_i \in \{0,1\}),$$
y podemos entonces identificar cada elemento de la base con un número de 0 a $2^n - 1$ en función del número que representa en binario, justificando la siguiente notación: $$\text{Si } k = \sum_{i = 0}^{n-1} a_i2^{n-i} \quad (a_i \in \{0,1\}) \qquad \text{ entonces } \ket{k} := \ket{a_0 \dots a_{n-1}}.$$

### Operaciones cuánticas

De manera análoga a los modelos de computación clásicos los ordenadores cuánticos consideran el tiempo de forma discreta. 
En este contexto se permiten dos tipos de operaciones: transformaciones unitarias (isométricas) que son deterministas y nos mantienen en el ámbito cuántico y mediciones que son no deterministas, irreversibles, y permiten comunicar el mundo cuántico con el clásico.

Dado un operador $A : H \to H'$ entre espacios de Hilbert notamos su aplicación a un elemento $\ket{\psi} \in H$ como $A\ket{\psi} := A(\ket{\psi})$. En dimensión finita, identificamos el operador con su matriz respecto de la base usual de tal forma que $A$ puede referirse al operador o a $\mathcal{M}(A, B_u, B_u)$.

Las operaciones cuánticas se corresponden con operadores unitarios

:::{.principle}
La evolución del estado de un sistema cuántico $\ket{\psi(t)}$ de un tiempo $t$ a un tiempo $t+1$ viene dada por una transformación unitaria $U$, esto es $$\ket{\psi(t+1)} = U\ket{\psi(t)}$$
:::

No todas las transformaciones unitarias son físicamente realizables, pero sí que podemos aproximarlas de forma eficiente a partir de un *conjunto universal* finito de transformaciones.

Por último las mediciones en el caso finito nos dan una variable aleatoria discreta.
Aunque el modelo general cuántico admite mediciones más generales que las que describimos a continuación el principio que presentamos es suficiente para simular, modificando convenientemente el ordenador cuántico con operaciones unitarias adecuadas cualquier medición arbitraria.

:::{.principle}
Una medición de un sistema cuántico de dimensión $N = 2^n$ con vector de estado $$\ket{\psi} = \sum_{i = 0}^{N-1} \alpha_i\ket{i}$$ es una variable aleatoria discreta $X: \Omega \to \{\ket{0},\dots, \ket{n-1}\}$ tal que $$P(X = \ket{i}) = |\alpha_i|^2 \quad ( i = 0, \dots, N-1)$$
:::

Como los vectores de estado son vectores unitarios tenemos que la variable aleatoria $X$ está bien definida ya que $$1 = \norm{\ket{\psi}}^2 = \sum_{i = 0}^{N-1} |\alpha_i|^2$$


### Algunos ejemplos de operaciones unitarias

TODO

## El modelo de circuitos cuánticos

A partir de este modelo físico que asumimos como dado construimos un modelo de computador cuántico.
Existen diversos modelos equivalentes que formalizan la noción de un algoritmo cuántico pero en este trabajo nos centramos en el modelo de *circuitos cuánticos*, que es el más utilizado.

La entrada de un circuito cuántico será un producto tensorial de qubits; aunque otros modelos son posibles nos restringimos a este por analogía al modelo de bits clásico. Permitimos además el uso de *qubits ancilla* que podamos utilizar para cálculos auxiliares.

:::{.definition}
Un circuito cuántico TODO

Si $x \in \{0,1\}^\ast$, notamos con $C_n(x)$ la variable aleatoria de su salida.

Una *familia de circuitos cuánticos* es una sucesión de circuitos cuánticos $\{C_n\}_{n \in \mathbb{N}}$ tal que $C_n$ tiene exactamente $n$ entradas.
:::


La noción de familia de circuitos cuánticos nos permite formalizar el cálculo de funciones $f:\{0,1\}^\ast \to \{0,1\}^\ast$. Como las mediciones son probabilísticas el resultado del cálculo por parte de una familia de circuitos cuánticos será, en general, no determinista, lo que formaliza la siguiente definición.

Para el cálculo de funciones debemos asumir que dada $x \in \{0,1\}^\ast$ arbitraria podemos preparar el estado inicial asociado $\ket{x}$ en como mucho $n = |x|$ pasos.

:::{.definition}
Una familia de circuitos cuánticos $\{C_n\}_{n \in \mathbb{N}}$ *calcula* una función $f: \{0,1\}^\ast \to \{0,1\}^\ast$ si para todo $x \in \{0,1\}^\ast$ con longitud $|x| = n \in \mathbb{N}$ se tiene que 
$$P[C_n(\ket{x}) = f(x)] \geq \frac23$$
:::

La constante $\frac23$ de la definición es arbitraria; dada una familia de circuitos cuánticos que calcule una función $f$ con probabilidad de éxito no nula podemos calcularla con probabilidad de éxito tan cercana a 1 como queramos sin más que repetir el algoritmo una cantidad constante de veces.

Una familia arbirtraria de circuitos puede calcular funciones no computables por una máquina de Turing; en estos casos la familia no sería realizable físicamente. Por ello debemos restringirnos a familias *uniformes*, que son constructibles físicamente

:::{.definition}
Una *familia uniforme de circuitos cuánticos* es una sucesión de circuitos cuánticos $\{C_n\}_{n \in \mathbb{N}}$ tal que existe una máquina de Turing $M$ que calcula dado $n \in \mathbb{N}$ una descripción de $C_n$.

Una familia uniforme de circuitos cuánticos se dice *de complejidad* $f(n)$ (resp. *polinomial*) si $M$ se ejecuta en tiempo $f(n)$ (resp. polinomial).
:::

La descripción del circuito puede limitarse a describir su grafo dirigido asociado a partir de su matriz de adyacencia junto con las etiquetas de cada nodo.



Dada una máquina de Turing $M$ que calcula una función $f$ con complejidad $O(T(n))$ existe una familia uniforme de circuitos cuánticos puede calcular $f$ con eficiencia $O(T(n))$, por lo que el modelo cuántico subsume al modelo clásico. Sin embargo para simplificar la presentación de los algoritmos estos tendrán una parte clásica y otra cuántica.


## Transformada de Fourier cuántica

TODO


## El problema del subgrupo oculto abeliano

En esta sección describimos la principal aplicación de la QFT en la computación cuántica. El problema más general conocido que puede resolverse haciendo uso de este algoritmo es el problema del subgrupo oculto para grupos abelianos finitamente generados. 

Este problema nos permite resolver eficientemente algunos problemas como la factorización de enteros o el cálculo de logaritmo discreto que son de gran importancia práctica debido a que su resolución eficiente permite romper algunos de los sistemas de encriptación más utilizados en la actualidad. 
Es un problema abierto si existen algoritmos clásicos eficientes que puedan resolver estos problemas sin la necesidad de recurrir a ordenadores cuánticos pero los investigadores del campo conjeturan que no existen tales algoritmos. 
Además, el problema del subgrupo abeliano tiene utilidad práctica para la resolución de otros problemas de naturaleza algebraica. [TODO cita a algunos dquantum algorithm zoo]

