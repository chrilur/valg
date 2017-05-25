##Valg
library(xlsx)
library(zoo)
library(data.table)

år <- c(1945,1949,1953,1957,1961,1965,1969,1973,1977,1981,1985,1989,1993,1997,2001,2005,2009,2013)

##Les inn data fra Excel, fjerne 0-rader og lagre som CSV
les.xlsx <- function(x) {
  filnavn <- paste0("data/alle-", x, ".xlsx")
  csvfil <- paste0("data/", x, ".csv")
  data <- read.xlsx(filnavn, sheetIndex = 1, stringsAsFactors=FALSE, encoding = "UTF-8")
  data <- subset(data, data[,3] > 0)
  write.csv(data, csvfil, row.names = FALSE, fileEncoding = "UTF-8")
}

les.csv <- function(år) {
  csvfil <- paste0("data/", år, ".csv")
  read.csv(csvfil, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
}

fiks.kom <- function(år) {
  data <- les.csv(år)
  csvfil <- paste0("data/", år, ".csv")
  data[,1] <- na.locf(data[,1])
  write.csv(data, csvfil, row.names = FALSE, fileEncoding = "UTF-8")
}

##Hent ut enkeltresultat fra en kommune i et gitt år 
get.res <- function(år,kom,par) {
  data <- les.csv(år)
  data <- as.data.table(data)
  data <- data[kommune %like% kom & parti %like% par]
  return(data)
}

get.oppsl <- function(år, kom, par){
  alle.res <- get.res(år,kom, "")
  total <- sum(alle.res[,3])
  res <- alle.res[parti %like% par]
  oppsl <- round(100*res[,3]/total, digits=1)
  names(oppsl) <- "%"
  res <- cbind(res,oppsl)
  return(res)
}

get.alle.år <- function(kom, par) {
  alle.år <- sapply(aar, function(x){get.oppsl(x,kom,par)})
  år <- as.data.frame(år)
  alle.år <- t(as.data.frame(alle.år))
  alle.år <- as.data.table(alle.år)
  alle.år <- cbind(år, alle.år)
  return(alle.år)
}