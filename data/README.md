# Data

## Data sources

Data coming from two sources: 
  - *Old bird censuses* provided by R. Zamora, consists in bird censuses in three locations: oak population (1700 masl); juniper-scrubland (2230 masl) and summit environments (3200 masl). Range temporal cover from 1981 to 1985. 
  
  - *Obsnev bird censuses* provided by [*OBSNEV*](https://obsnev.es/), realized in several transects distributed along Sierra Nevada. Temporal range from 2008 to 2020. The data were downloaded from new information system of OBSNEV (*i.e.* PostgreSQL [db01.obsnev.es](db01.obsnev.es))
  
All data are stored in the folder `/data_raw` 

### Notes for Old bird censuses (in Spanish)

- File `RObledal año 1981 RZAves_SN_10ha.xls`: 

  - habitat: oak woodlands (*Q. pyrenaica*)
  - elevation: 1700 masl 
  - year: 1981 
  - variable: bird abundance monthly aggregated (ind / 10 ha)
  - sample size: n = 3 (may, june, july)
  - notes: The data aren't the original bird censuses but are monthly aggregated

- File `Enebral año 1985 RZAves_SN_10ha.xls`

  - habitat: juniper-scrubland
  - elevation: 2300 masl 
  - year: 1985
  - variable: bird abundance monthly aggregated (ind / 10 ha)
  - sample size: n = 3 (may, june, july)
  - notes: The data aren't the original bird censuses but are monthly aggregated

- File `Aves_SN_meses_reproduccion.xls` 

  - habitat: jseveral habitats. We selected juniper-scrubland and summit environments 
  - elevation: 2300 and 3200 masl 
  - year: 1984 (juniper); 1982 (summit environment)
  - variable: raw bird abundance. For juniper ind / 10.2 ha; and for summit ind / 20 ha. 
  - sample size: n = 9 transects (juniper) and 6 transects (juniper) during may-july
  - notes: Original bird censuses 






  
