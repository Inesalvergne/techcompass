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
  credits: 100,
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
  description: "Google's software developers develop the next-generation technologies that change how billions of users connect, explore, and interact with information and one another. Our products need to handle information at massive scale, and extend well beyond web search. We're looking for software developers who bring fresh ideas from all areas, including information retrieval, distributed computing, large-scale system design, networking and data storage, security, artificial intelligence, natural language processing, UI design and mobile; the list goes on and is growing every day. As a software developer, you will work on a specific project critical to Google’s needs with opportunities to switch teams and projects as you and our fast-paced business grow and evolve. We need our software developers to be versatile, display leadership qualities and be enthusiastic to take on new problems across the full-stack as we continue to push technology forward.

  Open Source Developer Experience is a team dedicated to making the experience of Googlers working in Open Source for their jobs frictionless and satisfying, while staying compliant with Google policies. We will deliver a seamless workflow by piecing together existing solutions when possible, and building new ones when needed.

  Google is a software development company at heart. We hire people with a broad set of technical skills who are ready to take on some of technology's greatest challenges and make an impact on users around the world. At Google, software developers not only revolutionize search, they routinely work on scalability and storage solutions, large-scale applications and entirely new platforms for developers around the world. From Google Ads to Chrome, Android to YouTube, social to local, Google software developers are changing the world one technological achievement after another..",
  location: "Montreal, Quebec, Canada",
  role: ROLE[2],
  level: LEVEL[3],
  post_url: "https://careers.google.com/jobs/results/129701606946939590-senior-staff-software-developer-open-source/?hl=en&jlo=en-US&location=Montreal,%20QC,%20Canada",
  status: STATUS[0],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Automattic",
  description: "WordPress doesn’t try to keep its users inside walled gardens, a rare thing in a world that is dangerously moving away from the open web. Instead, WordPress gives them the freedom to build a business website, an online store, or a personal blog – the way they like it. Big sites or small, using the community-run open source project or Automattic’s WordPress.com, vanilla or customised with hundreds of plugins, WordPress users always get to own and control their data, their expression, and their freedom.",
  location: "Remote",
  role: ROLE[0],
  level: LEVEL[3],
  post_url: "https://automattic.com/work-with-us/job/senior-backend-software-engineer/",
  status: STATUS[2],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Condé Nast",
  description: "Condé Nast is a global media company producing the highest quality content with a footprint of more than 1 billion consumers in 32 territories through print, digital, video and social platforms. The company’s portfolio includes many of the world’s most respected and influential media properties including Vogue, Vanity Fair, Glamour, Self, GQ, The New Yorker, Condé Nast Traveler/Traveller, Allure, AD, Bon Appétit and Wired, among others. Condé Nast Entertainment was launched in 2011 to develop film, television and premium digital video programming.",
  location: "London, Great Britain",
  role: ROLE[2],
  level: LEVEL[3],
  post_url: "https://condenast.wd5.myworkdayjobs.com/en-US/CondeCareers/job/The-Adelphi-London-GB/Senior-Software-Engineer_R-09753",
  status: STATUS[3],
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
  level: LEVEL[3],
  post_url: "https://jobs.apple.com/en-ca/details/200378978/senior-software-engineer-apple-media-products?team=SFTWR",
  status: STATUS[0],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Chimera Entertainment",
  description: "Chimera Entertainment is a creative and independent development studio for digital entertainment software in the heart of the beautiful city of Munich. In addition to developing our own IPs, we implement work for hire, from conception to completion. Gameplay and creative imagination are always in the foreground, and we promote teamwork and talent. Thanks to more than 15 years of expertise in the field of mobile gaming and cross-platform development, as well as our award-winning portfolio of top titles such as “Angry Birds Epic” and “Angry Birds Evolution”, we are one of Germany’s leading game developers.


  As a successful and ambitious company since 2006, Chimera Entertainment is working on state-of-the-art projects with high-profile partners, which offers a dynamic, challenging, and ultimately rewarding experience. Our values and culture are defined by a healthy team spirit, a sustainable work environment, a passion for games, and the collaborative ambition to strive for excellence in an ever-changing industry, where our development studio is constantly striving to reach the next level.

  As a Backend Developer (f/m/d) at Chimera Entertainment, you will create high-quality, visually appealing games within an experienced, international and flexible team. As a successful and ambitious company with a sustainable and transparent leadership style, all of our employees work with dedication and a team-first attitude. Working on state-of-the-art projects with high-profile partners, will be your opportunity to grow and expand your knowledge within the games industry in a professional and friendly atmosphere.",
  location: "Munich, Germany",
  role: ROLE[0],
  level: LEVEL[1],
  post_url: "https://chimera-entertainment.jobs.personio.com/job/690557?display=en",
  status: STATUS[1],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "Creative Currency",
  description: "Creative Currency is recruiting an experienced Web Developer to play a key role on our small but mighty web team. We’re looking for someone who’s up for a new challenge, shares our vision for creativity and culture, and wants to be part of taking our offering to the next level.


  If you live and breathe web development and UX/UI, this job is for you. We’re looking for a strategic thinker who knows how to build innovative, high-quality websites and work seamlessly with design teams to execute projects for a wide range of clients and campaigns.

  You will be joining a 25+ member creative team, working directly with our lead web developer, designers, freelance and outside agency partners to bring our clients’ brands and campaigns to life on digital properties.


  This role sits amongst a team of young creative thinkers who are always looking for new and fresh ways to do things. We are a group of Swiss-army types, one day working on a social media campaign and another working on a full-service digital, traditional and OOH campaign. This often means working under tight timelines to get the job done. This individual will report to Creative Currency’s Creative Director and lead web developer. The ideal candidate will have 5-10 years experience working in-house or at an agency. Position is hybrid and can be based in Hamilton or Toronto.",
  location: "Toronto, Ontario, Canada",
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
  description: "The worldwide pioneer in the creation of interactive entertainment, Nintendo Co., Ltd., of Kyoto, Japan, manufactures and markets hardware and software for its Nintendo Switch™ system and the Nintendo 3DS™ family of portable systems. Since 1983, when it launched the Nintendo Entertainment System™, Nintendo has sold billions of video games and hundreds of millions of  hardware units globally, including Nintendo Switch and the Nintendo 3DS family of systems, as well as the Game Boy™, Game Boy Advance, Nintendo DS™ family of systems, Super NES™, Nintendo 64™, Nintendo GameCube™, Wii™, and Wii U™ systems. It has also created industry icons that have become well-known, household names, such as Mario, Donkey Kong, Metroid, Zelda and Pokémon. A wholly owned subsidiary, Nintendo of America Inc., based in Redmond, Wash., serves as headquarters for Nintendo’s operations in the Americas. For more information about Nintendo, please visit the company’s website at http://www.nintendo.com.

  Nintendo is an equal opportunity employer. We offer a welcoming and inclusive environment in service to one another, our products, the diverse consumers we represent, and the communities we call home. We do all of this with kindness, empathy and respect for each other.

  This team is focused on middleware, working primarily with AWS Serverless technologies to provide a data integration platform for global Nintendo systems.",
  location: "Redmond, Virginia, United States",
  role: ROLE[2],
  level: LEVEL[3],
  post_url: "https://careers.nintendo.com/job-openings/listing/210000005Q.html?src=CWS-10000",
  status: STATUS[0],
  remote: true,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "MindGeek",
  description: "If you want to work on some of the world’s biggest websites and have your work seen by millions every day, this might be the job for you. We’re looking for a Front-End Developer to take part in all stages of the web development life cycle.",
  location: "Nicosia, Cyprus",
  role: ROLE[1],
  level: LEVEL[1],
  post_url: "https://www.mindgeek.com/careers/?gh_jid=5854399002",
  status: STATUS[1],
  remote: false,
  goal: Goal.all.sample,
  user: me
)

Job.create!(
  company: "LANDR",
  description: "LANDR is looking for a Back End C# / .NET Software Developer who is a true team player with strong social and soft skills and who will want to leave its mark on a widely used cloud-based solution for the music industry.",
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
  description: "Are you interested in improving the creator experience at Twitch? Do you enjoy the challenge of building products with our customers? What about promoting important interactions with creators, especially around managing content, partner status, or identification? If so, you'd be a great fit for the Creator Business team. You'll report to the Engineering Manager for Creator and join a team to build products that solve and improve the lives of Twitch creators across the world.

  This position can be located in San Francisco, CA, Seattle, WA and New York, NY.",
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
          summary: "SUMMARY:
          Master a single language to start, and aim to interview in that language.
          Understand programming paradigms (imperative, procedural, object-oriented, parallel processing, declarative etc.)
          Learn data structures and algorithms,
          as these are the heart of all programming languages. Common data structures: 'Heap, Graph, Array, Stack, Linked List'
          Look at other people's code and try to understand the format, design patterns, styling and naming conventions.
          Always plan your strategy when dealing with a coding challenge. Choose the most relevant tools for your project.
          Web apps can be done with but not limited to: Ruby on Rails, Javascript, HTML/CSS.
          For machine learning and analytics: Python, Java, C# AND R.
          Don't rush through your project, but set meaningful deadlines.
          Most importantly, practice as much as possible to solidify your knowledge.
          Check out the 10 websites below for some additional coding training!",
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
             summary: "The phases of the interview process:
             Phone screen, technical phone interview, or on site
             Expect company specific and situational questions.
             Talk about yourself and any recent relevent projects.
             If possible with the company you are interviewing with,
             stick to the one language you are most comfortable with.
             Prepare for a take-home assignment and/or pair programming tasks
             Try to over-communicate as opposed to under-communicating
             Set up mock interviews to practice before the actual interview.
             Do not cram the night before, prepare adequately and get rest
             to perform at your optimal state.",
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
  summary: "Everyone knows the basics about preparing for an interview,
  pick an outfit that is clean and appropriate for the job level, do not
  wear too much perfume or cologne, and thoroughly research the company beforehand.
  I was recently involved with the interviews for digital marketing positions and was
  surprised to see that several of the candidates made the same mistakes.
  I should not have been too surprised, given digital marketings embryonic state.
  Still, the trip-ups among the candidates were common enough that I thought I could
  provide some tips to anyone looking to prepare for a digital marketing interview.",
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
  summary: "SUMMARY: A backend developer is responsible for writing backend codes and communicating when
  the user triggers any particular action. Today they have become the backbone of web development and
  they are in high demand in the vast scale of companies. Whatever you do in your application,
  the back-end is responsible for that as they work behind the curtains. The integrations,
  logic, APIs, all are being taken care of by back-end developers. That is why they are the
  foundation of web development. It is trending and has been resembled as one of
  the most desired jobs. But firstly, you need to understand the basics of backend
  development. A successful roadmap in backend development will start from the base itself
  i.e. in-depth knowledge of programming languages and will go along to applying it in real projects.
  Besides the fact, it is not mandated that every backend developer needs to follow the same strategy.
  Certain skill sets will define your career in backend development and those are the fundamental ones.
  So, today, we’re going to discuss the
  top 7 skills which are required to become a successful backend developer.",
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
                  summary: "Interested in becoming a backend developer? You have come to the right place.
                  If you have got some coding experience but are new to programming,
                  this guide will teach you all about backend development.
                  It can be overwhelming to learn everything at once, which is
                  why we break it down into steps. This way, you can learn at your
                  own pace and get help when you need it!
                  As a new developer, it is essential to know the basics before moving
                  to more advanced topics. This roadmap will provide an overview of what
                  you need to know as a beginner getting started with backend development.",
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

dst = File.open("db/data-sci-tips.txt")
data_sci_tips = Resource.create!(
                  title: "How To Apply To Data Science Jobs",
                  summary: "...",
                  votes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
                  level: "Junior",
                  user: User.where.not("full_name = 'Ines'").sample,
                  tags: "Back-End Developer",
                  rich_content: dst.read)
                  dst.close

image12 = URI.open("https://images.unsplash.com/photo-1580894732444-8ecded7900cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
back_end_roadmap.image.attach(io: image12, filename: 'image12.jpg', content_type: 'image/jpg')
back_end_roadmap.save!
