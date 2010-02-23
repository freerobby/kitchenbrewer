Factory.define :ingredient do |f|
  f.sequence(:title) {|t| "ingredient#{t}"}
  f.category {|category| category.association(:category)}
end