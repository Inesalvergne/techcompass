# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# markdown(for seed, "boxes")
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#


ROLE = ['Back-End Developer', 'Front-End Developer',
        'Full-Stack Developer'].freeze


LEVEL = ['Entry Level', 'Junior', 'Senior'].freeze

STATUS = ['Wishlist', 'Applied', 'Interview', 'Decision', 'Offer',
          'Rejected']



TAG = ['Back-End Developer', 'Front-End Developer',
                 'Full-Stack Developer', 'Digital Marketer']

Resource.destroy_all
User.destroy_all
Goal.destroy_all
Job.destroy_all

puts "Test string"




def create_user(name, title)
  return User.create!(
    full_name: name,
    job_title: title,
    email: "#{name}@email.com",
    password: "12345678",
    credits: 5,
  )
end


#puts "Creating user 1..."
#ibrahim = create_user("ibrahim", LEVEL[1])
#programmer_interview.user = ibrahim
#programmer_interview.save!




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


piq = File.open("db/programmer_interview_questions.txt")
basic_programmer_interviewqs = Resource.create!(
    title: "Essential Full-Stack interview questions",
    summary: "...",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "Junior",
    tags: "Full-Stack Developer",
    user: User.first,
    rich_content: piq.read
)
piq.close

efave_lang = File.open("db/efave_lang.txt")
basic_interview_qs = Resource.create!(
    title: "Basic programming interview questions",
    summary: "...",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "Junior",
    tags: "Full-Stack Developer",
    user: User.first,
    rich_content: efave_lang.read
)
efave_lang.close



fes_interviewqs = File.open("db/fes_interviewqs.txt")
senior_interview_qs = Resource.create!(
    title: "Senior Front-End Interview Questions",
    summary: "...",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "Senior",
    tags: "Front-End Developer",
    user: User.first,
    rich_content: fes_interviewqs.read)
    fes_interviewqs.close



  ber_iqs = File.open("db/ber_iqs.txt")
  back_end_ruby = Resource.create!(
    title: "Ruby Interview Questions",
    summary: "...",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "Junior",
    tags: "Back-End Developer",
    user: User.first,
    rich_content: ber_iqs.read)
   ber_iqs.close


fsportfolio = File.open("db/fs_devportfolio.txt")
full_stack_portfolio = Resource.create!(
        title: "Full Stack Developer Portfolio Tips",
        summary: "...",
        votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
        level: "Junior, Senior",
        tags: "Front-End Developer",
        user: User.first,
        rich_content: fsportfolio.read)
        fsportfolio.close


bep_iqs = File.open("db/bep_iqs.txt")
back_end_python = Resource.create!(
        title: "Python Developer Interview Tips",
        summary: "...",
        votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
        level: "Senior",
        tags: "Back-End Developer",
        user: User.first,
        rich_content: bep_iqs.read)
        bep_iqs.close

fes_iqs = File.open("db/fes_iqs.txt")
       front_end_senior = Resource.new(
          title: "Senior Front-End Interview Preparation",
          summary: "...",
          votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
          level: "Senior",
          user: User.first,
          tags: "Front-End Developer",
          rich_content: fes_iqs.read)
          fes_iqs.close


          demo1 = File.open("db/10challenges.txt")
       demo_seed = Resource.create!(
          title: "10 Coding Challenges, Tips, and Websites to Practice",
          summary: "...",
          votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
          level: "Junior",
          user: User.first,
          tags: "Full-Stack Developer",
          rich_content: demo1.read)
          demo1.close

          demo2 = File.open("db/softwaredev_int.txt")
          demo_seed2 = Resource.create!(
             title: "How To Prepare For A Software Developer Interview",
             summary: "...",
             votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
             level: "Junior",
             user: User.first,
             tags: "Full-Stack Developer",
             rich_content: demo2.read)
             demo2.close



dm_iqs = File.open("db/dm_interview.txt")
digital_marketing_interview = Resource.new(
  title: "Digital Marketing Interview Tips",
  summary: "...",
  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
  level: "Junior",
  tags: "Digital Marketer",
  user: User.first,
  rich_content: dm_iqs.read)
  dm_iqs.close

be_skills = File.open("db/be_skills.txt")
back_end_skills = Resource.new(
  title: "7 Must-Have Back-End Developer Skills",
  summary: "...",
  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
  level: "Junior",
  tags: "Back-End Developer",
  user: User.first,
  rich_content: be_skills.read)
  be_skills.close

  be_rm = File.open("db/be_roadmap.txt")
  back_end_roadmap = Resource.create!(
  title: "Complete Back-End Developer Roadmap",
  summary: "...",
  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
  level: "Junior",
  user: User.first,
  tags: "Back-End Developer",
  rich_content: be_rm.read)

  be_rm.close

# the commented out lines of code are already linked to
#text files in the db folder, but some are redundant so I commented them out for now.


#interview_questions = File.open("db/i_questions.txt")



#portfolio = File.open("db/portfolio_1.txt")


#fej_interviewqs = File.open("db/fej_interviewqs.txt")

#





#ber_iqs = File.open("db/ber_iqs.txt")



#bes = File.open("db/bes.txt")
