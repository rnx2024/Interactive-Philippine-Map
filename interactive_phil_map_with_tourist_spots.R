library(leaflet)
library(htmltools)

# Create a data frame with the locations, coordinates, and descriptions
tourist_spots <- data.frame(
  place = c("Palawan", "Vigan", "Intramuros", "Siargao", "Boracay", "Chocolate Hills", "Camiguin", 
            "Hundred Islands", "Banaue Rice Terraces", "Sagada", "Batanes", "Siquijor", "Baler", "San Juan, La Union", "Baguio"),
  lat = c(9.8349, 17.5748, 14.5897, 9.8667, 11.9685, 9.8223, 9.1000, 
          16.1925, 16.9310, 17.0830, 20.4474, 9.2086, 15.7480, 16.6956, 16.4023),
  lng = c(118.7388, 120.3873, 120.9738, 126.0500, 121.9248, 124.1756, 124.7000, 
          120.0156, 121.0830, 120.9000, 121.9687, 123.5076, 121.5950, 120.3194, 120.5960),
  description = c(
    "Known for its stunning beaches,<br>crystal-clear waters, and the famous<br>Puerto Princesa Underground River.",
    "A well-preserved Spanish colonial town,<br>famous for its historic architecture and<br>cobblestone streets.",
    "A historic walled area in Manila,<br>home to Fort Santiago, San Agustin Church,<br>and Rizal Park.",
    "A surfer's paradise known for its<br>world-class waves, beautiful beaches,<br>and vibrant island culture.",
    "Famed for its powdery white sand beaches<br>and crystal-clear waters, a top beach destination.",
    "A geological formation of over a thousand<br>chocolate-colored hills, an iconic natural wonder.",
    "Known as the 'Island Born of Fire',<br>Camiguin is famous for its volcanoes,<br>hot springs, and sweet lanzones fruit.",
    "Known for its 124 islets and abundant<br>marine life, perfect for island hopping<br>and water activities.",
    "Often called the 'Eighth Wonder of the World',<br>these ancient rice terraces are a breathtaking sight.",
    "Famous for its hanging coffins, caves,<br>and beautiful landscapes.",
    "A group of islands with stunning scenery<br>and a unique culture.",
    "Known as the 'Island of Healing',<br>famous for its mystical charm and beautiful beaches.",
    "Baler is famous for its surfing spots,<br>particularly Sabang Beach. It also boasts<br>historical sites like the Baler Church and<br>the Baler Hanging Bridge.",
    "San Juan, La Union is known for its<br>excellent surfing conditions, with a laid-back<br>vibe and beautiful sunsets.",
    "Baguio is renowned for its cool climate,<br>beautiful parks, vibrant arts scene,<br>and historical landmarks."
  )
)

# Create the interactive map
map <- leaflet() %>%
  addProviderTiles(providers$OpenStreetMap.Mapnik) %>%
  setView(lng = 121.7740, lat = 12.8797, zoom = 6) %>%
  setMaxBounds(lng1 = 115.0, lat1 = 5.0, lng2 = 130.0, lat2 = 20.0) # Setting bounds to cover the Philippines

# Loop through each location to add markers with descriptions
for (i in 1:nrow(tourist_spots)) {
  map <- map %>%
    addMarkers(
      lng = tourist_spots$lng[i],
      lat = tourist_spots$lat[i],
      popup = HTML(paste("<b>", tourist_spots$place[i], "</b><br>", tourist_spots$description[i])),
      label = HTML(paste("<b>", tourist_spots$place[i], "</b><br>", tourist_spots$description[i])),
      labelOptions = labelOptions(noHide = FALSE, direction = "auto", style = list("font-size" = "12px"))
    )
}

# Display the map
map
