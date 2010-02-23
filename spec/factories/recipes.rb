Factory.define :recipe do |f|
  f.sequence(:title) {|t| "recipe#{t}"}
  f.original_gravity 1.050
  f.final_gravity 1.011
  f.volume_in_gallons 5
  f.style {|style| style.association(:style)}
  f.ibus 30
  f.abv 5.109
  f.srm 6
  f.instructions "Step 1: Make the beer."
  f.author {|author| author.association(:user)}
  f.brew_type {|brew_type| brew_type.association(:brew_type)}
end