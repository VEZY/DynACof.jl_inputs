using DynACof
(
Tree_Species         = "Erythrina poeppigiana",   # Names of the shade Tree species
Species_ID           = "Erythrina_Aquiares",      # Optional species ID
StockingTree_treeha1 = 250.0,                     # density at planting (trees ha-1). Source: Taugourdeau et al. (2014)
SLA_Tree             = 17.4,                      # Specific leaf area (m2 kg-1). Source: Van Oijen et al. (2010 I)
wleaf_Tree           = 0.068,                     # Leaf width (m)
DELM_Tree            = 778.5,                     # Max Leaf carbon demand (gC tree d-1).
LAI_max_Tree         = 1.0,                       # Max measured LAI to compute leaf demand. Should be ~1.5*higher than measured.
Leaf_fall_rate_Tree  = [0.07,0.02,0.015,0.04],    # Mortality during leaf fall (fraction of the leaf mass).
Fall_Period_Tree     = (1:55,175:240,300:354,355:365), # Time period were leaves fall at high rate (DOY). List of length= Leaf_fall_rate_Tree
Thin_Age_Tree        = 22,                        # Ages at which thinning is made (age). Set to 9999 if no thinning
ThinThresh           = 0.0,                       # (option) Lowest transmittance threshold under wich thinning is triggered (0-1)
RateThinning_Tree    = 0.97072,                   # How many trees are thinned per thinning event in percentage.
date_Thin_Tree       = 100,                       # Date(s) of thinning (DOY)
D_pruning_Tree       = 213,                       # Date(s) of pruning each year (DOY). Set to 9999 if no pruning.
pruningIntensity_Tree= 0.7,                       # Pruning intensity (% dry mass)
m_FRoot_Tree         = 0.005,                     # Fine root percentage that die at pruning
Pruning_Age_Tree     = collect(1:21),             # Ages at which pruning is made (age). Set to 9999 if no pruning.
# k_Dif_Tree           = 0.305                   # Light extinction coefficient for diffuse light. Now computed by metamodels
# k_Dir_Tree           = 0.304                   # Light extinction coefficient for direct light. Now computed by metamodels
# lue_Tree             = 1.1375                  # Light-use efficiency (gc MJ-1). Now computed by metamodels
lambda_Stem_Tree     = 0.20,                      # Allocation coefficient to the stem. Source: Litton (2007)
lambda_Branch_Tree   = 0.25,                      # Allocation coefficient to the branches wood. Source: Litton (2007)
lambda_CR_Tree       = 0.10,                      # Allocation coefficient to the coarse roots. Source: Litton (2007)
lambda_Leaf_Tree     = 0.26,                      # Allocation coefficient to the Leaves. Source: Litton (2007)
lambda_FRoot_Tree    = 0.05,                      # Allocation coefficient to the fine roots. Source: Litton (2007)
kres_max_Tree        = 1.2,                       # Maximum carbon extracted from reserves compared to maintenance respiration
Res_max_Tree         = 150.0,                     # Maximum reserve until Tree always use it for growth
CC_Leaf_Tree         = 0.47,                      # Leaf carbon content in gC gDM-1. Source: Van Oijen et al. (2010)
CC_wood_Tree         = 0.47,                      # Wood carbon content in gC gDM-1. Source: Van Oijen et al. (2010)
epsilon_Branch_Tree  = 1.2,                       # Branch growth cost coefficient (gC.gC-1). Source: This study
epsilon_Stem_Tree    = 1.2,                       # Stem growth cost coefficient (gC.gC-1). Source: This study
epsilon_CR_Tree      = 1.33,                      # Coarse root growth cost coefficient (gC.gC-1). Source: Litton et al. (2007)
epsilon_Leaf_Tree    = 1.392,                     # Leaf growth cost coefficient (gC.gC-1). Source: Erythrina excelsa Villar and Merino (2001)
epsilon_FRoot_Tree   = 1.392,                     # Leaf growth cost coefficient (gC.gC-1). Considered = to leaves
epsilon_RE_Tree      = 1.000001,                  # Reserves growth cost coefficient (gC.gC-1). No cost unknown.
lifespan_Branch_Tree = 7300.0,                    # Branch lifespan natural mortality (d)
lifespan_Leaf_Tree   = 10^5,                      # Leaf lifespan (d). Taken infinite because regulated by leaf fall phenology.
lifespan_FRoot_Tree  = 90.0,                      # Fine roots lifespan (d).
lifespan_CR_Tree     = 7300.0,                    # Coarse roots lifespan (d). Source: Van Oijen et al. (2010I)
Kh                   = 0.46,                      # Allometries source: CAF2007 Van Oijen et al. (2010). Adjusted to fit our observations.
KhExp                = 0.5,                       # Allometries source: CAF2007 Van Oijen et al. (2010). Adjusted to fit our observations.
Kc                   = 8.0,                       # Allometries source: CAF2007 Van Oijen et al. (2010). Adjusted to fit our observations.
KcExp                = 0.45,                      # Allometries source: CAF2007 Van Oijen et al. (2010). Adjusted to fit our observations.
MRN_Tree             = 0.20,                      # Base maintenance respiration (gC.gN.day-1)
TMR_Tree             = 15.0,                       # Base temperature for maintenance respiration (deg C)
NC_Branch_Tree       = 0.005,                     # Branch nitrogen content (gN.gDM-1).
NC_Stem_Tree         = 0.005,                     # Stem nitrogen content (gN.gDM-1).
NC_CR_Tree           = 0.0084,                    # Coarse roots nitrogen content (gN.gDM-1). Source: Van Oijen et al. (2010I)
NC_Leaf_Tree         = 0.0359,                    # Leaf nitrogen content (gN.gDM-1). Source: average 3.35 to 3.82% Van Oijen et al. (2010I)
NC_FRoot_Tree        = 0.0084,                    # Fine root nitrogen content (gN.gDM-1). Taken = to leaves
Q10Branch_Tree       = 2.1,                       # Branch Q10 (-)
Q10Stem_Tree         = 1.7,                       # Stem Q10 (-)
Q10CR_Tree           = 2.1,                       # Coarse root Q10 (-)
Q10Leaf_Tree         = 1.896,                     # Leaf Q10 (-) see 1-DATA/Erythrina/Respiration.docx
Q10FRoot_Tree        = 1.4,                       # Fine root Q10 (-). Source: Van Oijen et al (2010I)
pa_Branch_Tree       = paliv_dis(40,0.4,0.05,5.0), # Branch living tissue (fraction). Not used (replaced by pa_Stem_Tree).
pa_Stem_Tree         = paliv_dis(40,0.3,0.05,5.0), # Computation of living tissue at each age (do not modify)
pa_CR_Tree           = 0.21,                      # Coarse roots living tissue (fraction)
pa_Leaf_Tree         = 1.0,                       # Leaf living tissue (fraction)
pa_FRoot_Tree        = 1.0,                       # Fine root living tissue (fraction)
WoodDensity          = 565.0,                     # Used for allometries, source http://www.wood-database.com/?s=cordia+alliodora.
KTOT_Tree            = 80.0,                       # soil to leaf hydrolic conducance (mol m-2 s-1 MPa-1)
k                    = light_extinction_K_Tree,   # Light extinction coefficient (modify if needed)
T_Tree               = T_Tree,                    # Metamodel for tree transpiration
H_Tree               = H_Tree,                    # Metamodel for tree sensible heat
lue_Tree             = lue_Tree,                  # Metamodel for tree lue
Allometries          = tree_allometries           # Idem for lue transpiration and sensible heat flux using MAESPA metamodels
)
