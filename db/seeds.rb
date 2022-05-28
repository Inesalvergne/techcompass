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


file = File.open("db/programmer_interview_questions.txt")
programmer_interview = Resource.new(
    title: "Top interview questions",
    summary: "",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: LEVEL.sample,
    tags: TAG.sample,
    rich_content: file.read
)
file.close

def create_user(name, title)
  User.create!(
    full_name: name,
    job_title: title,
    email: "#{name}@email.com",
    password: "12345678",
    credits: 5,
  )
end


ROLE = ['Back-End Developer', 'Front-End Developer',
        'Full-Stack Developer'].freeze


LEVEL = ['Entry Level', 'Junior', 'Senior'].freeze

STATUS = ['Wishlist', 'Applied', 'Interview', 'Decision', 'Offer',
          'Rejected'].freeze



TAG = ['Back-End Developer', 'Front-End Developer',
                 'Full-Stack Developer']




puts "Creating user 1..."
ibrahim = create_user("ibrahim", levels[1])

programmer_interview.user = ibrahim
programmer_interview.save




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
end

g_interview_q = File.open("db/programmer_interview_questions.txt")

efave_lang = File.open("db/efave_lang.txt")

piq = File.open("db/piq.txt")

interview_questions = File.open("db/i_questions.txt")



portfolio = File.open("db/portfolio_1.txt")


fej_interviewqs = File.open("db/fej_interviewqs.txt")

fes_interviewqs = File.open("db/fes_interviewqs.txt")

fes_iqs = File.open("db/fes_iqs.txt")

ber_iqs = File.open("db/ber_iqs.txt")

ber_iqs = File.open("db/ber_iqs.txt")

bep_iqs = File.open("db/bep_iqs.txt")

bes = File.open("db/bes.txt")
