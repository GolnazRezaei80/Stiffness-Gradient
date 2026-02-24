* 1. Compute classical geometric mean for X-axis
gen gmean = sqrt(PWV * RbaPWV_ABI)

* 3. Back-transform xriml predictions to ratio
gen ratio_mean  = exp(M_ml)
gen ratio_upper = exp(M_ml + 1.96*S_ml)
gen ratio_lower = exp(M_ml - 1.96*S_ml)
* Optional: skew/kurtosis-adjusted limits
gen ratio_C3  = exp(C3_ml)
gen ratio_C97 = exp(C97_ml)


twoway rarea ratio_mean_ll ratio_mean_ul gmean, sort color(gs14) || rarea ratio_C3_ll ratio_C3_ul gmean, sort color(gs14) ||rarea ratio_C97_ll ratio_C97_ul gmean, sort color(gs14) || line ratio_mean gmean, sort lwidth(medthick) lcolor(blue) || line ratio_C3 gmean, sort lpattern(dash) lcolor(green) || line ratio_C97 gmean, sort lpattern(dash) lcolor(red)  || scatter PWV_ratio gmean, msize(vsmall) mcolor(black) legend(off) ytitle("baPWV/cfPWV") xtitle("G-Mean") title("Predicted mean and centile curves with 95% CI (XRIML model)")
