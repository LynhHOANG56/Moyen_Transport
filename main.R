

dt0 <- read.csv("moyen_transport.csv", header=T,sep=","); 
dim(dt0); head(dt0)

library(raster)
library(cartography) 

FranceDep <- getData(name="GADM", country="FRA", level=2)
indD <- dt0$idxD;  
concordance <- dt0[indD, 3]; concordance
FranceDep$Pas.de.transport<- concordance
echelle <- c(seq(150,738000,by=7341)); echelle
couleurs <- colorRampPalette(c('white', 'blue','green','yellow', 'red'))

spplot(FranceDep, "Pas.de.transport", col.regions= couleurs(101),
       at = echelle, main=list(cex=1.2, label="Pas de transport"))



