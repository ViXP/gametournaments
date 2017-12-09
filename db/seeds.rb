require 'open-uri'

Captain.destroy_all
cap1 = Captain.create!(
  login: 'FirstCaptain', email: 'firstcaptain@mail.co',
  password: 'SomeLongPassword123!',
  salt: 'some_salt'
)

team1 = Team.create!(
  captain: cap1,
  title: 'First Captain team',
  remote_logo_url: 'https://i.pinimg.com/originals/2d/cd/80/2dcd80c6f5a21a437'\
    '313adde93b373d8.jpg'
)

100.times do |i|
  Tournament.create!(title: "Test tournament \##{i}")
end
