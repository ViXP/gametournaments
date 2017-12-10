require 'open-uri'

Captain.destroy_all
Team.destroy_all
Tournament.destroy_all

cap1 = Captain.create!(login: 'FirstCaptain', email: 'firstcaptain@mail.co')
cap2 = Captain.create!(login: 'SecondCaptain', email: 'secondcaptain@mail.co')

team1 = Team.create!(
  captain: cap1,
  title: 'First Captain team',
  remote_logo_url: 'https://i.pinimg.com/originals/2d/cd/80/2dcd80c6f5a21a437'\
    '313adde93b373d8.jpg'
)
team2 = Team.create!(
  captain: cap2,
  title: 'Second Captain team',
  remote_logo_url: 'https://www.axeonwater.com/blog/wp-content/uploads/2014/'\
    '03/2000px-Biohazard_symbol_svg.png'
)

100.times do |i|
  Tournament.create!(title: "Test tournament \##{i}")
    .teams << [team1, team2].sample
end
