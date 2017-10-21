library("redist")
library("spdep")
library("rgdal")
library("ggplot2")
library("sf")

#data<-readOGR(dsn="./data/mcd_phl_cartogram.shp")
#slotNames(data)
#slotNames(data@polygons[[1]])

cd <- st_read("./data/mcd_phl_cartogram.shp", stringsAsFactors = FALSE)
head(cd)




data$rn <- row.names(data)

plot()

#plot(data)

# redist.rsg(adj.list, population, ndists, thresh, verbose = TRUE, maxiter=5000)



redist.mcmc(
    adjobj,
    popvec,
    nsims,
    ndists = 18,
    initcds = NULL,
    loopscompleted = 0,
    nloop = 1,
    nthin = 1, eprob = 0.05, lambda = 0,
popcons = NULL, grouppopvec = NULL, ssdmat = NULL,
beta = 0, temper = "none", constraint = "none",
betaseq = "powerlaw", betaseqlength = 10,
betaweights = NULL,
adjswaps = TRUE, rngseed = NULL, maxiterrsg = 5000,
adapt_lambda = FALSE, adapt_eprob = FALSE,
contiguitymap = "rooks", exact_mh = FALSE, savename = NULL, verbose = TRUE)



data(algdat.pfull)

set.seed(1)
initcds <- algdat.pfull$cdmat[,sample(1:ncol(algdat.pfull$cdmat), 1)]

## Run the algorithm
alg_253 <- redist.mcmc(
    adjobj = algdat.pfull$adjlist,
    popvec = algdat.pfull$precinct.data$pop,
    ndists = 18,
    initcds = initcds,
    nsims = 10000)

