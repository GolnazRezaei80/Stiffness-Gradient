fracpoly: regress diff mean , compare
predict res, residuals
gen sd = sqrt(3.14/2)*abs(res)
fracpoly: regress sd mean, compare
xriml diff mean, fp(m:1 1, s:1) dist(n)  se
estat ic
qnorm Z_ml
swilk Z_ml
xriml diff mean, fp(m:1 1, s:1) dist(en)  se
estat ic
qnorm Z_ml
swilk Z_ml
xriml diff mean, fp(m:1 1, s:1) dist(men)  se
estat ic
qnorm Z_ml
swilk Z_ml
