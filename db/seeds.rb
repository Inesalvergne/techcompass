# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# markdown(for seed, "boxes")
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all
Goal.destroy_all
Job.destroy_all
Resource.destroy_all
puts "Test string"

def create_user(name, title)
  User.create!(
    full_name: name,
    job_title: title,
    email: "#{name}@email.com",
    password: "12345678",
    credits: 5,
  )
end

puts "Creating user 1..."
ibrahim = create_user("ibrahim", levels[1])

file = File.open("db/articles.txt")
results = file.read

levels = ['Entry-Level', 'Junior', 'Senior']
levels.freeze
ROLE = ['Back-End Developer', 'Front-End Developer',
        'Full-Stack Developer'].freeze


LEVEL = ['Entry Level', 'Junior', 'Senior'].freeze

STATUS = ['Wishlist', 'Applied', 'Interview', 'Decision', 'Offer',
          'Rejected'].freeze

# levels = ['Entry-Level', 'Junior', 'Senior', 'CEO']
# levels.freeze

# statuses = ['Wishlist', 'Applied', 'Interview', 'Decision', 'Offer', 'Rejected']
# statuses.freeze

<<<<<<< HEAD
tags = ['front-end', 'back-end', 'full stack']
tags.freeze
=======
TAG = ['Back-End Developer', 'Front-End Developer',
       'Full-Stack Developer'].freeze
>>>>>>> 40ef23a5d5823a59745bf4ed305fb0c1fdd6e51c


User.create!(
  full_name: "Bob Jones",
  job_title: Faker::Job.title,
  email: "bob.jones@gmail.com",
  password: "12345678",
  credits: 5
)

puts "Creating other users..."
4.times do
  User.create!(
    full_name: Faker::Name.name,
    job_title: Faker::Job.title,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    credits: 5
  )
end

puts "Creating goals..."
5.times do
  Goal.create!(
    job_target: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    description: "I want to achieve my dream of being a #{Faker::Job.title}",
    user: User.first
  )
end

puts "Creating jobs..."
5.times do
  Job.create!(
    company: Faker::Company.name,
    description: "It's a company.",
    location: Faker::Address.city,
    role: ROLE.sample,
    level: LEVEL.sample,
    post_url: Faker::Internet.url(host: 'linkedin.com'),
    status: STATUS.sample,
    remote: true,
    goal: Goal.all.sample
  )
end

puts "Creating resources..."
5.times do
  Resource.create!(
    title: Faker::Games::StreetFighter.quote,
    summary: Faker::Lorem.paragraph,
    content: Faker::Lorem.paragraphs.join,
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: LEVEL.sample,
    tags: TAG.sample,
    user: User.first
  )

  g_interview_q = File.open("db/programmer_interview_questions.txt")
results = file.read
  Resource.create!(
    title: "Programmer Interview Questions",
    summary: "...",
    content: Faker::Lorem.paragraphs.join,
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "1",
    tags: tags.sample,
    user: User.first
    rich_content: results
  )
end
