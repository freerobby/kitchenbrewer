Factory.define :brew do |f|
  f.sequence(:user_id) {|t| t}
  f.recipe_title "Irish Stout"
end