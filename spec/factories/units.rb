Factory.define :unit do |f|
  f.sequence(:title) {|t| "unit#{t}"}
  f.sequence(:abbreviation) {|t| "abbr#{t}"}
end