Factory.define :style do |f|
  f.sequence(:title) {|t| "style#{t}"}
end