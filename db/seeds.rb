# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 50 users
# only 20 users has profils
# users.sample booking for the profile
# some of the booking has review
Review.destroy_all
Hangout.destroy_all
Profile.destroy_all
User.destroy_all

puts "creating fake users..."
50.times do |number|
  user = User.new(email: "email_#{number}@gmail.com", password: "password")
  user.save!
end

puts "creating fake profiles..."
User.all.sample(20).each do |user|
  profile = Profile.new(
             name: Faker::Name.name,
             gender: Profile::GENRES.sample,
             age: rand(18..40),
             interest: Faker::Hobby.activity,
             average_rating: rand(1.0..5.0).round(2),
             user: user)
  profile.save!
  rand(5..10).times do
    future = [true, false].sample
    date = future ? Date.today + rand(1..10) : Date.today - rand(10..20)
    status = future ? ["pending", "reject", "accept"].sample : "completed"
    puts "creating hangouts....."
    hangout = Hangout.new(
              status: status,
              date: date,
              time: Time.now,
              profile: profile,
              user: User.all.sample,
              seed: true)
    hangout.save!

    if hangout.status == "completed"
      puts "creating reviews....."
      review = Review.new(
                comment: Faker::Restaurant.review,
                rating: rand(1..5),
                hangout: hangout,
                user: hangout.user)
      review.save!
    end
  end
end




puts "finish"
