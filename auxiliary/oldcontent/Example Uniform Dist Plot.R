#uniform plot example

lo <- -5
hi <- 5
x <- seq(lo - 1, hi + 1, 0.01)
pdf_of_x <- dunif(x, lo, hi)

cdf_of_x <- punif(x, lo, hi)

probabilities <- seq(0, 1, 0.01)
inverse_cdf_of_x <- qunif(probabilities, lo, hi)

layout(matrix(1:3))
plot(x, pdf_of_x, type = "l", main = "PDF of x")
plot(x, cdf_of_x, type = "l", main = "CDF of x")
plot(probabilities, inverse_cdf_of_x, type = "l", , main = "Inverse CDF of x")