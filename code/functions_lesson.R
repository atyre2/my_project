# defining a new function
fahr_to_kelvin <- function(fahr){
  kelvin <- ((fahr - 32)*(5/9)) + 273.15
  return(kelvin)
}

kelvin_to_celsius <- function(kelvin){
  kelvin - 273.15
}