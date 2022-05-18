# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Goal.destroy_all
Job.destroy_all
Resource.destroy_all
puts "Test string"
5.times do
  User.create!(
    full_name: Faker::Name.name,
    job_title: Faker::Job.title,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    credits: 5
  )
end

5.times do
  Goal.create!(
    job_target: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    description: "I want to achieve my dream of being a #{Faker::Job.title}",
    user: User.all.sample
  )
end
puts "Test string before Job.create"
5.times do
  Job.create!(
    company: Faker::Company.name,
    description: "It's a company.",
    location: Faker::Address.city,
    role: Faker::Job.title,
    level: ['Entry-Level', 'Junior', 'Senior', 'CEO'].sample,
    post_url: Faker::Internet.url(host: 'linkedin.com'),
    remote: true,
    goal: Goal.all.sample
  )
end

5.times do
  Resource.create!(
    title: Faker::Games::StreetFighter.quote,
    summary: Faker::Lorem.paragraph,
    content: Faker::Lorem.paragraphs,
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: ['Entry-Level', 'Junior', 'Senior', 'CEO'].sample,
    tags: ['developer', 'front-end', 'back-end', 'full stack'].sample,
    user: User.all.sample
  )
end
