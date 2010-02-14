Factory.define :user do |f|
  f.sequence(:email) {|t| "user#{t}@domain.com"}
  f.password "password"
  f.password_confirmation "password"
end