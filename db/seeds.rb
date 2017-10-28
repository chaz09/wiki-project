require 'faker'

15.times do
   user = User.new(
   email:    Faker::Internet.email,
   password: Faker::Internet.password(6),
   role: [:standard, :premium, :collaborator].sample
   )
 end

5.times do
admin = User.create!(

  email:    'admin@example.com',
  password: 'helloworld',
  role:     :admin
)

collaborator = Collaborator.create!(

  email:    'collaborator@example.com',
  password: 'helloworld',
  role:     :collaborator
)

premium_member = User.create!(

  email:    'premium@user.com',
  password: 'password',
  role: :premium
  )
users = User.all


10.times do
  wiki = Wiki.create!(
  title: Faker::TheFreshPrinceOfBelAir.character,
  body: Faker::TheFreshPrinceOfBelAir.quote
  )

wikis = Wiki.all

end
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
