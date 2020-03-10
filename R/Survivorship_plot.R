
Survivorship_plot <- function(genSpp, Years = 5, extraYears = 5, M = NULL, F.Adult = 0, ageFishingStart = 4,  ageMax = NULL, addFishlife_M = TRUE, addLineColor = 'green', ...) {

   Survivorship <- function(Year, F.Adult = 0, ageFishingStart = 4, M = 0) {
   
        Fvec = c(rep(0, ageFishingStart - 1), rep(F.Adult, Year - ageFishingStart + 1))
        propLeft <- c(1, rep(NA, Year - 1))
        
        for( i  in 1:(Year - 1)) {
          propLeft[i + 1] <- propLeft[i] * (exp(-(Fvec[i] + M)))
        } 
        
        propLeft
   }

   fishlife <- function (species) {
       # Based on a function from Jason Cope of the same name.
       if (species != "") {
           spp <- sort(unique(species))
           fl <- data.frame(species = spp, linf_cm = NA, k = NA, 
               winf_g = NA, tmax_yr = NA, tmat_yr = NA, m = NA, 
               lmat_cm = NA, temp_c = NA, stringsAsFactors = F)
           for (i in 1:nrow(fl)) {
               sciname <- fl$species[i]
               genus <- stringr::word(sciname, 1)
               nwords_in_spp <- length(strsplit(sciname, " ")[[1]])
               species <- stringr::word(sciname, start = 2, end = nwords_in_spp)
               species <- ifelse(species == "spp", "predictive", 
                   species)
               spp_info <- try(FishLife::Plot_taxa(FishLife::Search_species(Genus = genus, 
                   Species = species)$match_taxonomy, mfrow = c(2, 
                   2)))
               if (inherits(spp_info, "try-error")) {
               }
               else {
                   spp_lh_vals_log <- spp_info[[1]]$Mean_pred
                   spp_lh_vals <- c(exp(spp_lh_vals_log[1:7]), spp_lh_vals_log[8], 
                     spp_lh_vals_log[9:20])
               }
           }
           spp_lh_vals
       }
       else {
           return(NA)
       }
   }
   
# ----------------------------------------------

   N <- extraYears
   
   if(addFishlife_M) {
   
     library(FishLife)
     cat("\n")
     GP <- fishlife(genSpp)
     cat("\n\n"); print(GP); cat("\n\n")
     M <- c(GP['M'], M)
     Years <- 1:GP['tm']
     if(is.null(ageMax))
        ageMax <- GP['tmax']
     N <- round(GP['tm']) + extraYears
     
   } else
     N <- Years + extraYears
    

   dev.new()    
   yearSurv <- NULL
   for ( i in 1:length(M))
        yearSurv <- rbind(yearSurv, data.frame(Year = 1:N, M = paste0('M = ', round(M[i], 5)), Survivorship = Survivorship(N, F = F.Adult, ageFishingStart = ageFishingStart, M = M[i])))
  
   
   lattice::xyplot(Survivorship ~ Year, groups = M, data = yearSurv, auto = TRUE, type = 'o', lwd = 2, cex = 1.25, panel = function(...) { panel.xyplot(...); 
        panel.abline(v = ageMax, col = 'cyan', lwd = 2); panel.abline(h = 0, col = 'grey' ); panel.text(ageMax - 0.8, 0.80, "Max Age") }, ...)
   
}

