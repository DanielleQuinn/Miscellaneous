# ---- FUNCTION: confint_mod ----
# Calculates confidence limits around Schnabel estimate when total recaptures is < 50
# Ricker (1975) and Krebs (1999) suggest this method for constructing CI for N with Schnabel method if
# total recaptures is < 50: a Poisson approximation for constructing a CI is used and the endpoints
# into N = sum(captures*totalmarked)/totalrecaptures to construct CI for N

# Arguments:
## cmrtable: dataframe where each row is a capture event, has the following variables:
### n = number of individuals captured
### m = number of recaptured individuals
### M = number of total marked fish available for capture at the beginning of the capture event
## cival: confidence level, default is 0.95; range between 0.01 and 0.99

confint_mod<-function(cmrtable, cival=0.95)
{
myrecaps<-sum(poptable$m)
numerator<-sum(poptable$n*poptable$M)
highCI<-numerator/poiCI(x=sum(poptable$m), conf.level=cival, type="exact")[1]
lowCI<-numerator/poiCI(x=sum(poptable$m), conf.level=cival, type="exact")[2]
output<-c(lowCI, highCI)
names(output)<-c("low CI", "high CI")
return(output)
}
