extractData <- function(datafile)
{
  txt <- readLines(datafile)

  ## 0  Dimensions
  ## Variable names from catageysa.tpl
  firstyear <- scan(text=txt, skip=1, nlines=1, quiet=TRUE)[1]
  lastyear <- scan(text=txt, skip=1, nlines=1, quiet=TRUE)[2]
  firstdatayear <- scan(text=txt, skip=1, nlines=1, quiet=TRUE)[3]
  lastdatayear <- scan(text=txt, skip=1, nlines=1, quiet=TRUE)[4]
  firstage <- scan(text=txt, skip=1, nlines=1, quiet=TRUE)[5]
  nages <- scan(text=txt, skip=1, nlines=1, quiet=TRUE)[7]
  firstcatchage <- scan(text=txt, skip=1, nlines=1, quiet=TRUE)[8]
  a1 <- firstcatchage - firstage + 1
  nyrs <- lastyear - firstyear + 1
  ndatayears <- lastdatayear - firstdatayear + 1

  ## 1  Catch at age
  catage <- data.frame(Year=firstyear:lastyear,
                       read.table(text=txt, skip=grep("Landa.*ur afli",txt),
                                  nrows=nyrs))
  names(catage) <- c("Year", a1:nages)

  ## 2  Catch weights
  wcatch <- data.frame(Year=firstdatayear:(lastdatayear+4),
                       read.table(text=txt, skip=grep("Weights in catch",txt),
                                  nrows=ndatayears+4))
  names(wcatch) <- c("Year", a1:nages)

  ## 3  Maturity
  maturity <- data.frame(Year=firstdatayear:(lastdatayear+4),
                         read.table(text=txt, skip=grep("sexual maturity",txt),
                                    nrows=ndatayears+4))
  names(maturity) <- c("Year", a1:nages)

  ## 4  Stock weights
  wstock <- data.frame(firstdatayear:(lastdatayear+4),
                       read.table(text=txt, skip=grep("Stockweights",txt),
                                  nrows=ndatayears+4))
  names(wstock) <- c("Year", 1:nages)

  ## 5  Spring survey (SMB)
  surveyfirstyear <- scan(text=txt, skip=grep("Survey data",txt)[1],
                          nlines=1, quiet=TRUE)[1]
  surveylastyear <- scan(text=txt, skip=grep("Survey data",txt)[1],
                         nlines=1, quiet=TRUE)[2]
  surveyfirstage <- scan(text=txt, skip=grep("ages for survey",txt)[1],
                         nlines=1, quiet=TRUE)[1]
  surveylastage <- scan(text=txt, skip=grep("ages for survey",txt)[1],
                        nlines=1, quiet=TRUE)[2]
  survey.smb <- data.frame(Year=surveyfirstyear:surveylastyear,
                           read.table(text=txt, skip=grep("#data",txt)[1],
                                      nrows=surveylastyear-surveyfirstyear+1))
  names(survey.smb) <- c("Year", surveyfirstage:surveylastage)

  ## 6  Autumn survey (SMH)
  surveyfirstyear2 <- scan(text=txt, skip=grep("Survey data",txt)[2],
                           nlines=1, quiet=TRUE)[1]
  surveylastyear2 <- scan(text=txt, skip=grep("Survey data",txt)[2],
                          nlines=1, quiet=TRUE)[2]
  surveyfirstage2 <- scan(text=txt, skip=grep("ages for survey",txt)[2],
                          nlines=1, quiet=TRUE)[1]
  surveylastage2 <- scan(text=txt, skip=grep("ages for survey",txt)[2],
                         nlines=1, quiet=TRUE)[2]
  survey.smh <- data.frame(Year=surveyfirstyear2:surveylastyear2,
                           read.table(text=txt, skip=grep("#data",txt)[2],
                                      nrows=surveylastyear2-surveyfirstyear2+1))
  names(survey.smh) <- c("Year", surveyfirstage2:surveylastage2)
  survey.smh[survey.smh<0] <- NA

  list(catage=catage, wcatch=wcatch, maturity=maturity,
       wstock=wstock, survey.smb=survey.smb, survey.smh=survey.smh)
}
