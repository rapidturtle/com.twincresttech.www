Factory.define :user do |u|
  u.uid "%d"
  u.provider "google_oauth2"
  u.first_name "Mickey"
  u.last_name "Mouse"
  u.email "mickey.mouse@disney.com"
end
