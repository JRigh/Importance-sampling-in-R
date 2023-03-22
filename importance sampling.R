#-------------------------
# Importance sampling in R
#-------------------------

# crude Monte Carlo estimation
h <- function(x) {
  (cos(x) + sin(x))^2
}

n = 10000
xi <- runif(n = n)

set.seed(2023)
theta_hat <- mean(h(xi))
theta_hat
# [1] 1.707224

# plots
par(mfrow=c(1,2), pty="s")
# plot the function
x1 <- seq(from = 0, to = 1, by = 0.001)
plot(x1, h(x1), type = "l", ylab = "h(x)", xlab = "x", col = 'red')
abline(h = 0)
# plot convergence of MC estimator
seq = 1:n
plot(cumsum(h(xi))/seq, type="l", ylab="MC estimator",
     xlab = "n")
# standard error theta_hat
setheta_hat = sqrt(cumsum(h(x)^2)/seq - (cumsum(h(x))/seq)^2)
# lower bound of 95% confidence interval
lines(cumsum(h(xi))/seq - qnorm(1-0.025) * setheta_hat / sqrt(seq), type="l",
      col="red",lty=2)
# upper bound of 95% confidence interval
lines(cumsum(h(xi))/seq + qnorm(1-0.025) * setheta_hat / sqrt(seq), type="l",
      col="red",lty=2)

# importance sampling example

set.seed(1986)
n <- 10000
theta.hat <- se <- numeric(2)
h <- function(x) {exp(-x)/(1+x^2)}  # function to integrate
# crude MC estimation
u <- runif(n)
fg_1 <- h(u)

theta.hat[1] <- mean(fg_1)  # the crude MC estimator
se[1] <- sd(fg_1)/sqrt(n)  # its estimated standard error

x <- tan(pi * u / 4)   # x's are transformation of u's via the choosen function
fg_2 <- h(x) / (4 / ((1 + x^2) * pi))  # integration of f_tilde

theta.hat[2] <- mean(fg_2)   # the importance sampling MC estimator
se[2] <- sd(fg_2)/sqrt(n)  # its estimated standard error

table=as.data.frame(rbind(theta.hat, se))
names(table)=c("crude MC","IS MC")
table  # ISMC estimator has a smaller variance
#              crude MC       IS MC
# theta.hat 0.525188327 0.524929528
# se        0.002453147 0.001414611

# plot convergence of MC estimators
par(mfrow=c(1,1))
seq = 1:(n/2)
plot(cumsum(fg[1:(n/2)])/seq, type="l", ylab="MC estimators", col="firebrick3",
     xlab = "n/2", main = "Convergence of the MC estimators", lwd = 2)
lines(cumsum(fgx[1:(n/2)])/seq, type="l", col="black",lwd = 2)
legend(3000, 0.6, legend=c("Crude MC estimator (black)", "IS MC estimator (red)"),
       col=c('black', 'firebrick3'), lty=1, cex=0.7)


#----
# end
#----