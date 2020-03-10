
Create a survivorship plot in R with natural mortality (M) and optional culling (e.g. fishing) mortality on adults (F.Adult).

Examples:


    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 0, extraYears = 10)

    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 0.5, ageFishingStart = 2, ageMax = 4)

    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 1.0, ageFishingStart = 2, ageMax = 4)

    Survivorship_plot("Brevoortia tyrannus", M = c(0.37, 0.5, 1.17), F.Adult = 1.5, ageFishingStart = 2, ageMax = 4)




