Factory.define :user do |u|
  u.uid "1234567890"
  u.provider "google_oauth2"
  u.first_name "Mickey"
  u.last_name "Mouse"
  u.email "mickey.mouse@disney.com"
end
