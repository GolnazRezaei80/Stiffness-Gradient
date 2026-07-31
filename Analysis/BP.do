* Original model
xriml logratio loggmean, fp(m:1, s:1) dist(men) centile(7.5 92.5) se
scalar beta_nobp = el(e(b),1,1)
* SBP-adjusted model
xriml logratio loggmean, fp(m:1, s:1) covars(m: ClinicSBP) dist(men) centile(7.5 92.5) se
scalar beta_sbp = el(e(b),1,1)
* DBP-adjusted model
xriml logratio loggmean, fp(m:1, s:1) covars(m: ClinicDBP) dist(men) centile(7.5 92.5) se
scalar beta_dbp = el(e(b),1,1)
* Compare the three proportional-bias coefficients
display "No BP: " beta_nobp
display "SBP:    " beta_sbp
display "DBP:    " beta_dbp
