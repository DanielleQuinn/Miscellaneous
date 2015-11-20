newsubset<-NULL
for(STATION in unique(data$station))
{
  x<-data[data$station==STATION,]
  for(REC in unique(x$rec))
  {
    xx<-x[x$rec==REC,]
    my_end_date<-data2$enddate[data2$station==STATION & data2$rec==REC]
    addme<-xx[xx$date>my_end_date,]
    newsubset<-rbind(newsubset, addme)
  }
}