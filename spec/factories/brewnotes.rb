Factory.define :brewnote do |f|
  f.sequence(:brew_id) {|t| t}
  f.body "This is a brew note!"
  f.recorded_at Time.zone.now
end