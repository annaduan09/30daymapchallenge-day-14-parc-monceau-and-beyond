#### SETUP ####
# libraries
library(sf)
library(ggplot2)
library(tidyverse)
library(mapview)
library(stringr)

# data 
streets <- st_read("voie.geojson")

arrondissement <- st_read("arrondissements.geojson")

parks <- st_read("espaces_verts.geojson") %>%
  st_as_sf() %>%
  select(nom_ev) %>%
  st_intersection(st_union(arrondissement))

laseine <- st_read("plan-de-voirie-voies-deau.geojson")

#### MAP ####
ggplot() +
  #geom_sf(data = arrondissement, fill = "gray95", color = NA) +
  geom_sf(data = parks, fill = "darkolivegreen3", color = NA, alpha = 0.7) +
  geom_sf(data = streets, color = "black", fill = NA, alpha = 0.03) +
  geom_sf(data = arrondissement, color = "gray80", fill = NA, size = 6) +
  geom_sf(data = laseine, fill = "lightblue2", color = NA) +
  theme_void()
