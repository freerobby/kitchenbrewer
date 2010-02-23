Factory.define :brew_type do |f|
  f.sequence(:title) {|t| "brew_type#{t}"}
end