# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# markdown(for seed, "boxes")
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

require "open-uri"

ROLE = ['Back-End Developer', 'Front-End Developer',
        'Full-Stack Developer', 'Digital Marketer', 'Data Scientist',
        'Data Analyst', 'Product Manager'].freeze

STATUS = ['Wishlist', 'Applied', 'Interview', 'Decision', 'Offer',
        'Rejected'].freeze

TAGS = ['Back-End Developer', 'Front-End Developer',
        'Full-Stack Developer', 'Digital Marketer', 'Data Scientist',
        'Data Analyst', 'Product Manager'].freeze

LEVEL = ['Entry-Level', 'Junior', 'Intermediate', 'Senior', 'Manager'].freeze

puts "Destroy all data"

Resource.destroy_all
User.destroy_all
Goal.destroy_all
Job.destroy_all

# --------------------------------------------------------------
# SETTING UP THE PROFILE OF THE PITCHER FOR DEMO
# --------------------------------------------------------------

puts "Creating my profile"
me = User.create!(
  full_name: "Ines",
  job_title: Faker::Job.title,
  email: "ines@gmail.com",
  password: "12345678",
  credits: 0,
  image_url: "Ines-headshot.jpg"
)


puts "Creating other users..."
50.times do
  User.create!(
    full_name: Faker::Name.name,
    job_title: Faker::Job.title,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    credits: 10
  )
end

puts "Creating my goal"
  Goal.create!(
    job_target: 15,
    description: "In three months, I want to achieve my dream of transitioning to web development.",
    user: me
  )

puts "Creating jobs..."
Job.create!(
  company: "Google",
  description: "Google is a software development company at heart. We hire people with a broad set of
                technical skills who are ready to take on some of technology's greatest challenges and make an
                impact on users around the world.",
  location: "Montreal, Quebec, Canada",
  role: ROLE[2],
  level: LEVEL[1],
  post_url: "https://careers.google.com/jobs/results/129701606946939590-senior-staff-software-developer-open-source/?hl=en&jlo=en-US&location=Montreal,%20QC,%20Canada",
  status: STATUS[0],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Automattic",
  description: "Engineers at Automattic are responsible for the engines of Automattic: a variety of
                codebases and processes devoted to making the web a better place. With their varied backgrounds,
                our engineers collaborate with the other roles at Automattic to define, implement, and
                improve the experience those engines provide and enable.",
  location: "Remote",
  role: ROLE[2],
  level: LEVEL[1],
  post_url: "https://automattic.com/work-with-us/job/senior-backend-software-engineer/",
  status: STATUS[2],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "CGI",
  description: "Experienced in Java programming, Web application development,
                data engineering, preferably with exposure to Cloud architectures and public Cloud offerings.",
  location: "Montréal, Canada",
  role: ROLE[2],
  level: LEVEL[1],
  post_url: "https://condenast.wd5.myworkdayjobs.com/en-US/CondeCareers/job/The-Adelphi-London-GB/Senior-Software-Engineer_R-09753",
  status: STATUS[0],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Apple",
  description: "The Apple Media Products Engineering team is one of the most exciting examples of Apple’s long-held passion for combining art and technology. These are the people who power the App Store, Apple TV, Apple Music, Apple Podcasts, and Apple Books. And they do it on a substantial scale, meeting Apple’s high expectations with dedication to deliver a huge variety of entertainment in over 35 languages to more than 150 countries.

  These engineers build secure, end-to-end solutions. They develop the custom software used to process all the creative work, the tools that providers use to deliver that media, all the server-side systems, and the APIs for many Apple services. Thanks to Apple’s unique integration of hardware, software, and services, engineers here partner to get behind a single unified vision. That vision always includes a deep commitment to strengthening Apple’s privacy policy, one of Apple’s core values. Although services are a bigger part of Apple’s business than ever before, these teams remain small, forward-thinking, and multi-functional, offering greater exposure to the array of opportunities here.",
  location: "Vancouver, British Columbia, Canada",
  role: ROLE[2],
  level: LEVEL[1],
  post_url: "https://jobs.apple.com/en-ca/details/200378978/senior-software-engineer-apple-media-products?team=SFTWR",
  status: STATUS[0],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Potloc",
  description: "Potloc has become an expert in gathering and centralizing valuable insights that enable
                businesses to better understand and tackle their ongoing challenges. We are sourcing survey
                respondents on social media networks, through advanced geolocation and interest-based targeting.",
  location: "Montréal, Canada",
  role: ROLE[1],
  level: LEVEL[0],
  post_url: "https://www.potloc.com/careers",
  status: STATUS[1],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Dialogue",
  description: "Dialogue is Canada’s leading virtual care provider, dedicated to delivering
                exceptional online health and wellness programs to organizations that wish to
                improve the well-being of their employees and their families",
  location: "Montréal, Canada",
  role: ROLE[0],
  level: LEVEL[1],
  post_url: "https://www.dialogue.co/en/careers",
  status: STATUS[1],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "La Web Shop",
  description: "If you have experience in Front-End React development,
                if you are autonomous, resourceful and if you want to work in an environment
                that promotes exchange, learning and creativity, your place is certainly with us.
                And if you also have a base in Ruby On Rails, then you are the rare pearl we are waiting for!",
  location: "Montréal, Canada",
  role: ROLE[1],
  level: LEVEL[0],
  post_url: "https://lawebshop.ca/developpeur-react/",
  status: STATUS[3],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Coveo",
  description: "At Coveo is where you’ll meet super passionate individuals united by
                a desire to take challenges head-on and solve problems with real ingenuity.
                It’s where we come together to learn, grow, and accomplish the incredible.",
  location: "Montréal, Canada",
  role: ROLE[1],
  level: LEVEL[0],
  post_url: "https://www.coveo.com/en/company/careers",
  status: STATUS[1],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Wealthsimple",
  description: "Wealthsimple is on a mission to help everyone achieve financial freedom,
                no matter who they are or how much they have. Using smart technology,
                Wealthsimple takes financial services that are often confusing, opaque
                and expensive and makes them simple, transparent, and low-cost.",
  location: "Montréal, Canada",
  role: ROLE[2],
  level: LEVEL[0],
  post_url: "https://www.wealthsimple.com/en-ca/careers",
  status: STATUS[1],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Creative Currency",
  description: "Creative Currency is recruiting an experienced Web Developer to play a key role on our small but
                mighty web team. We’re looking for someone who’s up for a new challenge, shares our vision for
                creativity and culture, and wants to be part of taking our offering to the next level.",
  location: "Toronto, Canada",
  role: ROLE[2],
  level: LEVEL[0],
  post_url: "https://www.linkedin.com/jobs/view/3102291235/?eBP=CwEAAAGBHJ8OnGvo1gql5pr9nL0zanTB0sycyffXlYa4C5WhutNDs3Bnwr2KBUQIso1ccU1Btq3Op4gp-wXc0e-4zoIekUBENuXIe9jNwXaDgLMv751t9EbZr9UVnBkdnLqjuLDEHWtI5HqlFBGRhlYg_yOXCH8WlfRu0g1Jm5jQu-VBqPjaLmG-xow8iaAsC9Lij3meSpHPLjARszkq0oAHHCGLcXD_yoXtBDBbC49OIz_uDn6svIP2nkc72_ObDETy4qqdlk4LkcpL-dhWSFHKWUdQHOMurDGb4x-zAwKwUGf0--dGXKUUHknlwq7bRl9VqhBJBd2qcVeHUaiYtGKxf3sQgxfT_Mdd4zZlnUNe8YUACKIjP00QXv-r5PizvFPyFN-4hc33KH-1cZXkR4hC3qg&recommendedFlavor=ACTIVELY_HIRING_COMPANY&refId=GYyynu83tzSSCUJn30IzOQ%3D%3D&trackingId=ceZYX3JIho5ujtm899Vcqg%3D%3D&trk=flagship3_search_srp_jobs",
  status: STATUS[1],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Nintendo",
  description: "This team is focused on middleware, working primarily with AWS Serverless technologies to
                provide a data integration platform for global Nintendo systems.",
  location: "Redmond, Virginia, United States",
  role: ROLE[2],
  level: LEVEL[1],
  post_url: "https://careers.nintendo.com/job-openings/listing/210000005Q.html?src=CWS-10000",
  status: STATUS[0],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Unito",
  description: "Our hiring process is a two-way street. After you go through an initial phone screen and interview,
                you’ll get a chance to work on a paid pilot project to see if Unito’s a good fit for you.
                It’s your chance to show us how you work and our chance to show you why Unito is a great place to do it.",
  location: "Montréal, Canada",
  role: ROLE[1],
  level: LEVEL[0],
  post_url: "https://unito.io/careers/",
  status: STATUS[2],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "LANDR",
  description: "LANDR is looking for a Back End C# / .NET Software Developer who is a true team player with strong social
                and soft skills and who will want to leave its mark on a widely used cloud-based solution for the music industry.",
  location: "Montreal, Quebec, Canada",
  role: ROLE[0],
  level: LEVEL[1],
  post_url: "https://landr.bamboohr.com/jobs/view.php?id=129",
  status: STATUS[5],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Twitch",
  description: "Are you interested in improving the creator experience at Twitch? Do you enjoy the challenge of building
                products with our customers? What about promoting important interactions with creators, especially around managing content,
                partner status, or identification? If so, you'd be a great fit for the Creator Business team.",
  location: "San Franscisco, California, United States",
  role: ROLE[1],
  level: LEVEL[1],
  post_url: "https://www.twitch.tv/jobs/en/careers/5986892002/",
  status: STATUS[0],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

puts "Creating resources..."

# --------------------------------------------------------------
# RESOURCE SEED
# --------------------------------------------------------------

# Essential Full-Stack interview questions

piq = File.open("db/programmer_interview_questions.txt")
basic_programmer_interviewqs = Resource.create!(
    title: "Essential Full-Stack interview questions",
    summary: "...",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "Junior",
    tags: "Full-Stack Developer",
    user: User.where.not("full_name = 'Ines'").sample,
    rich_content: piq.read
)
piq.close

image1 = URI.open("https://images.unsplash.com/photo-1532622785990-d2c36a76f5a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
basic_programmer_interviewqs.image.attach(io: image1, filename: 'image1.jpg', content_type: 'image/jpg')
basic_programmer_interviewqs.save!

# Basic programming interview questions

efave_lang = File.open("db/efave_lang.txt")
basic_interview_qs = Resource.create!(
    title: "Basic programming interview questions",
    summary: "...",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "Junior",
    tags: "Full-Stack Developer",
    user: User.where.not("full_name = 'Ines'").sample,
    rich_content: efave_lang.read
)
efave_lang.close

image2 = URI.open("https://images.unsplash.com/photo-1532622785990-d2c36a76f5a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
basic_interview_qs.image.attach(io: image2, filename: 'image2.jpg', content_type: 'image/jpg')
basic_interview_qs.save!


fes_interviewqs = File.open("db/fes_interviewqs.txt")
senior_interview_qs = Resource.create!(
    title: "Senior Front-End Interview Questions",
    summary: "...",
    votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    level: "Senior",
    tags: "Front-End Developer",
    user: User.where.not("full_name = 'Ines'").sample,
    rich_content: fes_interviewqs.read)
    fes_interviewqs.close

image3 = URI.open("https://images.unsplash.com/photo-1552960562-daf630e9278b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
senior_interview_qs.image.attach(io: image3, filename: 'image3.jpg', content_type: 'image/jpg')
senior_interview_qs.save!


fsportfolio = File.open("db/fs_devportfolio.txt")
full_stack_portfolio = Resource.create!(
        title: "Full Stack Developer Portfolio Tips",
        summary: "...",
        votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
        level: "Junior, Senior",
        tags: "Front-End Developer",
        user: User.where.not("full_name = 'Ines'").sample,
        rich_content: fsportfolio.read)
        fsportfolio.close

image4 = URI.open("https://images.unsplash.com/photo-1558655146-d09347e92766?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80")
full_stack_portfolio.image.attach(io: image4, filename: 'image4.jpg', content_type: 'image/jpg')
full_stack_portfolio.save!


bep_iqs = File.open("db/bep_iqs.txt")
back_end_python = Resource.create!(
        title: "Python Developer Interview Tips",
        summary: "...",
        votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
        level: "Senior",
        tags: "Back-End Developer",
        user: User.where.not("full_name = 'Ines'").sample,
        rich_content: bep_iqs.read)
        bep_iqs.close

image5 = URI.open("https://images.unsplash.com/photo-1526379095098-d400fd0bf935?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2064&q=80")
back_end_python.image.attach(io: image5, filename: 'image5.jpg', content_type: 'image/jpg')
back_end_python.save!

fes_iqs = File.open("db/fes_iqs.txt")
front_end_senior = Resource.create!(
          title: "Senior Front-End Interview Preparation",
          summary: "...",
          votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
          level: "Senior",
          user: User.where.not("full_name = 'Ines'").sample,
          tags: "Front-End Developer",
          rich_content: fes_iqs.read)
          fes_iqs.close

image6 = URI.open("https://images.unsplash.com/photo-1573497620053-ea5300f94f21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
front_end_senior.image.attach(io: image6, filename: 'image6.jpg', content_type: 'image/jpg')
front_end_senior.save!


demo1 = File.open("db/10challenges.txt")
demo_seed = Resource.create!(
          title: "10 Coding Challenges, Tips, and Websites to Practice",
          summary: "...",
          votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
          level: "Junior",
          user: User.where.not("full_name = 'Ines'").sample,
          tags: "Full-Stack Developer",
          rich_content: demo1.read)
          demo1.close


image6 = URI.open("https://images.unsplash.com/photo-1580894742597-87bc8789db3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
demo_seed.image.attach(io: image6, filename: 'image6.jpg', content_type: 'image/jpg')
demo_seed.save!

demo3 = File.open("db/ber_iqs.txt")
back_end_ruby = Resource.create!(
                title: "Ruby Interview Questions",
                summary: "...",
                votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
                level: "Junior",
                tags: "Back-End Developer",
                user: User.where.not("full_name = 'Ines'").sample,
                rich_content: demo3.read)
                demo3.close


image7 = URI.open("https://images.unsplash.com/photo-1597008641621-cefdcf718025?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1478&q=80")
back_end_ruby.image.attach(io: image7, filename: 'image7.jpg', content_type: 'image/jpg')
back_end_ruby.save!

demo2 = File.open("db/softwaredev_int.txt")
demo_seed2 = Resource.create!(
             title: "How To Prepare For A Software Developer Interview",
             summary: "...",
             votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
             level: "Junior",
             user: User.where.not("full_name = 'Ines'").sample,
             tags: "Full-Stack Developer",
             rich_content: demo2.read)
             demo2.close

image8 = URI.open("https://images.unsplash.com/photo-1565728744382-61accd4aa148?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1773&q=80")
demo_seed2.image.attach(io: image8, filename: 'image8.jpg', content_type: 'image/jpg')
demo_seed2.save!

dm_iqs = File.open("db/dm_interview.txt")
digital_marketing_interview = Resource.create!(
  title: "Digital Marketing Interview Tips",
  summary: "...",
  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
  level: "Junior",
  tags: "Digital Marketer",
  user: User.where.not("full_name = 'Ines'").sample,
  rich_content: dm_iqs.read)
  dm_iqs.close

image9 = URI.open("https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
digital_marketing_interview.image.attach(io: image9, filename: 'image9.jpg', content_type: 'image/jpg')
digital_marketing_interview.save!


be_skills = File.open("db/be_skills.txt")
back_end_skills = Resource.create!(
  title: "7 Must-Have Back-End Developer Skills",
  summary: "...",
  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
  level: "Junior",
  tags: "Back-End Developer",
  user: User.where.not("full_name = 'Ines'").sample,
  rich_content: be_skills.read)
  be_skills.close

image10 = URI.open("https://images.unsplash.com/photo-1581089778245-3ce67677f718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
back_end_skills.image.attach(io: image10, filename: 'image10.jpg', content_type: 'image/jpg')
back_end_skills.save!

be_rm = File.open("db/be_roadmap.txt")
back_end_roadmap = Resource.create!(
                  title: "Complete Back-End Developer Roadmap",
                  summary: "...",
                  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
                  level: "Junior",
                  user: User.where.not("full_name = 'Ines'").sample,
                  tags: "Back-End Developer",
                  rich_content: be_rm.read)
                  be_rm.close

image11 = URI.open("https://images.unsplash.com/photo-1523289333742-be1143f6b766?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
back_end_roadmap.image.attach(io: image11, filename: 'image11.jpg', content_type: 'image/jpg')
back_end_roadmap.save!

# the commented out lines of code are already linked to
#text files in the db folder, but some are redundant so I commented them out for now.
#interview_questions = File.open("db/i_questions.txt")

#portfolio = File.open("db/portfolio_1.txt")


=begin
  fej_interviewqs = File.open("db/fej_interviewqs.txt")
  back_end_roadmap = Resource.create!(
  title: "Junior Front-End Interview Questions",
  summary: "...",
  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
  level: "Junior",
  user: User.first,
  tags: "Front-End Developer",
  rich_content: fej_interviewqs.read)
  fej_interviewqs.close
=end

#ber_iqs = File.open("db/ber_iqs.txt")
#portfolio = File.open("db/portfolio_1.txt")

bes = File.open("db/bes.txt")
back_end_roadmap = Resource.create!(
                  title: "Senior Back-End Developer Tips",
                  summary: "...",
                  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
                  level: "Senior",
                  user: User.where.not("full_name = 'Ines'").sample,
                  tags: "Back-End Developer",
                  rich_content: bes.read)
                  bes.close

image12 = URI.open("https://images.unsplash.com/photo-1580894732444-8ecded7900cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
back_end_roadmap.image.attach(io: image12, filename: 'image12.jpg', content_type: 'image/jpg')
back_end_roadmap.save!
