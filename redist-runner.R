library("redist")
library("spdep")
library("rgdal")
library("ggplot2")
#library("sf")

NUM_DISTRICTS <- 18

data<-readOGR(dsn="./data/mcd_phl_cartogram.shp")
slotNames(data)


slotNames(data@polygons[[1]])

data@data


# paste(data@data$McdName, data@data$Lv3Name)



# redist.rsg(adj.list, population, ndists, thresh, verbose = TRUE, maxiter=5000)

set.seed(1)

params <- expand.grid(eprob = c(.01, .05, .1))

# redist.findparams(
#    adjobj=data,
#    popvec=data@data$TotPop,
#    nsims=10000,
#    params = params,
#    ndists = NUM_DISTRICTS
# )

# redist.rsg(adj.list=data,
#            population=data@data$TotPop,
#            ndists=NUM_DISTRICTS,
#            thresh=0.10,
#            verbose = TRUE,
#            maxiter=500000)

redist.mcmc(
    adjobj=data,
    popvec=data@data$TotPop,
    nsims=100,
    ndists = NUM_DISTRICTS,
    maxiterrsg = 1000000,
    popcons = 0.1,
    initcds = NULL, loopscompleted = 0, nloop = 1, nthin = 1, eprob = 0.05, lambda = 0,
    grouppopvec = NULL, ssdmat = NULL, beta = 0, temper = "none", adjswaps = TRUE,
    rngseed = NULL, adapt_lambda = FALSE, adapt_eprob = FALSE,
    contiguitymap = "rooks", exact_mh = FALSE, savename = NULL, verbose = TRUE)





data(algdat.pfull)

initcds <- algdat.pfull$cdmat[,sample(1:ncol(algdat.pfull$cdmat), 1)]

## Run the algorithm
alg_253 <- redist.mcmc(
    adjobj = algdat.pfull$adjlist,
    popvec = algdat.pfull$precinct.data$pop,
    ndists = 18,
    initcds = initcds,
    nsims = 10000)

