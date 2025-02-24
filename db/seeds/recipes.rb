base = %W[Chocomani Parchita Toddy Oreo_Original Oreo_Americana Arequipe_con_Flips Limón Ovolmaltina ]
top = %W[Nutella ArequipeYCoco Chocolate_Blanco Ovolmaltina]

base.each do |b|
  Recipe.create(
    name: b,
    recipe_type: 0,
    size: 0,
  )
  Recipe.create(
    name: b,
    recipe_type: 0,
    size: 1,
  )
end

top.each do |t|
  Recipe.create(
    name: t,
    recipe_type: 1,
    size: 0,
  )
  Recipe.create(
    name: t,
    recipe_type: 1,
    size: 1,
  )
end