## Importance sampling in R
Importance sampling in R course notes and code.

Importance sampling a Monte Carlo method to speed up the convergence of the MC estimates.

We start by approximating an integral of interest, namely

$$
\theta = \int_{0}^{1} (cos(x) + sin(x))^{2}
$$

with crude Monte Carlo estimation. We get the following result

![image1](/assets/image1.png)

Then we take another example to approximate the following integral

$$
\int_{0}^{1} \frac{e^{-x}}{1 - x^{2}} dx
$$

and we show that the convergence is more stable and achieved faster with importance sampling, as seen on this graph.

![image2](/assets/image2.png)

Enjoy the content.
