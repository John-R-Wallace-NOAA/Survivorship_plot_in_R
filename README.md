
Install into R with:

    JRWToolBox::gitAFile("John-R-Wallace-NOAA/Survivorship_plot_in_R/master/R/Survivorship_plot.R")


Create a survivorship plot in R with natural mortality (M) and optional harvesting (e.g. fishing) mortality on adults (F.Adult).
Includes (by default) an estimate of M from the R package FishLife (https://github.com/James-Thorson-NOAA/FishLife) which is required for FishLife's estimate.

Examples:

    # Atlantic menhaden (Brevoortia tyrannus)
    
    # No fishing mortality with various levels of M, including FishLife's estimate
    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 0, extraYears = 10) 


    # Various levels of fishing mortality
    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 0.5, ageFishingStart = 2, ageMax = 4)

    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 1.0, ageFishingStart = 2, ageMax = 4)

    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 1.5, ageFishingStart = 2, ageMax = 4)


View the example figure with this direct link:

   https://raw.githubusercontent.com/John-R-Wallace-NOAA/Survivorship_plot_in_R/master/Survivorship_no_Fishing_Mortality.png

