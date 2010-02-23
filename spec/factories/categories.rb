Factory.define :category do |f|
  f.sequence(:title) {|t| "category#{t}"}
end