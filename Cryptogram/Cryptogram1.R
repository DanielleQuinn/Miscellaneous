# Shifting Substitution Cipher #
# DQ #
# Updated January 25, 2018 #

# these updates make things more efficient but slightly less robust; for example, text will be converted to lowercase

setcode<-function(m,a,b)
{
  alpha<-letters[c((a+1):length(letters),1:(a))]
  m.vec<-strsplit(tolower(m),"")[[1]]
  for(i in which(m.vec %in% letters))
  {
    m.vec[i]<-letters[which(alpha==m.vec[i])]
    alpha<-alpha[c((b+1):length(alpha),1:(b))]
  }
  readme<<-paste(m.vec, collapse='')
  return(readme)
}

# m is a character string with the message you want to encrypt
# a and b are the keys to coding and solving the message, both need to be between 1 and 24

decode<-function(m,a,b)
{
  alpha<-letters[c((length(letters)-(a-1)):length(letters),1:(length(letters)-a))]
  m.vec<-strsplit(tolower(m),"")[[1]]
  for(i in which(m.vec %in% letters))
  {
    m.vec[i]<-letters[which(alpha==m.vec[i])]
    alpha<-alpha[c((length(alpha)-(b-1)):length(alpha),1:(length(alpha)-b))]      
  }
  readme<<-paste(m.vec, collapse='')
  return(readme)
}
# m is a character string of the encrypted message
# a and b are the keys that were use to encrypt it


decode(readme, 14, 18)
# or
setcode("Hello world", 14,18)
decode("Tqfny oozbb", 14, 18)
