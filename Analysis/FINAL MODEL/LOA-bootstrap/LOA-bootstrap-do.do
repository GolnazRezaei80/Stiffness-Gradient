xriml logratio loggmean , fp(m:1, s:1) dist(men) centile(3 97) se nograph
program define xr_loaboot, rclass
    quietly {
        capture drop C3_ml C97_ml
       xriml logratio loggmean , fp(m:1, s:1) dist(men) centile(3 97) se nograph
        summarize C3_ml, meanonly
        return scalar LOA_lower = r(mean)
        summarize C97_ml, meanonly
        return scalar LOA_upper = r(mean)
    }
end
bootstrap LOA_lower=r(LOA_lower) LOA_upper=r(LOA_upper), reps(1000) seed(12345): xr_loaboot
* Point estimates (log scale)
display exp(0.001138)
display exp(0.664838)
* 95% CI for lower ratio limit
display exp(-0.0385764)
display exp(0.0408525)
* 95% CI for upper ratio limit
display exp(0.621211)
display exp(0.7084649)