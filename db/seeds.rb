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
    credits: 5
  )
end

User.create!(
  full_name: "Bob Jones",
  job_title: Faker::Job.title,
  email: "bob.jones@gmail.com",
  password: "12345678",
  credits: 10
)

puts "Creating other users..."
4.times do
  User.create!(
    full_name: Faker::Name.name,
    job_title: Faker::Job.title,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    credits: 10
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
Job.create!(
  company: "Google",
  description: "Google's software developers develop the next-generation technologies that change how billions of users connect, explore, and interact with information and one another. Our products need to handle information at massive scale, and extend well beyond web search. We're looking for software developers who bring fresh ideas from all areas, including information retrieval, distributed computing, large-scale system design, networking and data storage, security, artificial intelligence, natural language processing, UI design and mobile; the list goes on and is growing every day. As a software developer, you will work on a specific project critical to Google’s needs with opportunities to switch teams and projects as you and our fast-paced business grow and evolve. We need our software developers to be versatile, display leadership qualities and be enthusiastic to take on new problems across the full-stack as we continue to push technology forward.

  Open Source Developer Experience is a team dedicated to making the experience of Googlers working in Open Source for their jobs frictionless and satisfying, while staying compliant with Google policies. We will deliver a seamless workflow by piecing together existing solutions when possible, and building new ones when needed.

  Google is a software development company at heart. We hire people with a broad set of technical skills who are ready to take on some of technology's greatest challenges and make an impact on users around the world. At Google, software developers not only revolutionize search, they routinely work on scalability and storage solutions, large-scale applications and entirely new platforms for developers around the world. From Google Ads to Chrome, Android to YouTube, social to local, Google software developers are changing the world one technological achievement after another..",
  location: "Montreal, Quebec, Canada",
  role: ROLE[2],
  level: LEVEL[2],
  post_url: "https://careers.google.com/jobs/results/129701606946939590-senior-staff-software-developer-open-source/?hl=en&jlo=en-US&location=Montreal,%20QC,%20Canada",
  status: STATUS[4],
  remote: false,
  goal: Goal.all.sample
)

Job.create!(
  company: "Automattic",
  description: "WordPress doesn’t try to keep its users inside walled gardens, a rare thing in a world that is dangerously moving away from the open web. Instead, WordPress gives them the freedom to build a business website, an online store, or a personal blog – the way they like it. Big sites or small, using the community-run open source project or Automattic’s WordPress.com, vanilla or customised with hundreds of plugins, WordPress users always get to own and control their data, their expression, and their freedom.",
  location: "Remote",
  role: ROLE[0],
  level: LEVEL[2],
  post_url: "https://automattic.com/work-with-us/job/senior-backend-software-engineer/",
  status: STATUS[2],
  remote: true,
  goal: Goal.all.sample
)

Job.create!(
  company: "Condé Nast",
  description: "Condé Nast is a global media company producing the highest quality content with a footprint of more than 1 billion consumers in 32 territories through print, digital, video and social platforms. The company’s portfolio includes many of the world’s most respected and influential media properties including Vogue, Vanity Fair, Glamour, Self, GQ, The New Yorker, Condé Nast Traveler/Traveller, Allure, AD, Bon Appétit and Wired, among others. Condé Nast Entertainment was launched in 2011 to develop film, television and premium digital video programming.",
  location: "London, Great Britain",
  role: ROLE[2],
  level: LEVEL[2],
  post_url: "https://condenast.wd5.myworkdayjobs.com/en-US/CondeCareers/job/The-Adelphi-London-GB/Senior-Software-Engineer_R-09753",
  status: STATUS[3],
  remote: false,
  goal: Goal.all.sample
)

Job.create!(
  company: "Apple",
  description: "The Apple Media Products Engineering team is one of the most exciting examples of Apple’s long-held passion for combining art and technology. These are the people who power the App Store, Apple TV, Apple Music, Apple Podcasts, and Apple Books. And they do it on a substantial scale, meeting Apple’s high expectations with dedication to deliver a huge variety of entertainment in over 35 languages to more than 150 countries.

  These engineers build secure, end-to-end solutions. They develop the custom software used to process all the creative work, the tools that providers use to deliver that media, all the server-side systems, and the APIs for many Apple services. Thanks to Apple’s unique integration of hardware, software, and services, engineers here partner to get behind a single unified vision. That vision always includes a deep commitment to strengthening Apple’s privacy policy, one of Apple’s core values. Although services are a bigger part of Apple’s business than ever before, these teams remain small, forward-thinking, and multi-functional, offering greater exposure to the array of opportunities here.",
  location: "Vancouver, British Columbia, Canada",
  role: ROLE[2],
  level: LEVEL[2],
  post_url: "https://jobs.apple.com/en-ca/details/200378978/senior-software-engineer-apple-media-products?team=SFTWR",
  status: STATUS[0],
  remote: false,
  goal: Goal.all.sample
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
  status: STATUS[2],
  remote: true,
  goal: Goal.all.sample
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
  goal: Goal.all.sample
)

Job.create!(
  company: "Nintendo",
  description: "The worldwide pioneer in the creation of interactive entertainment, Nintendo Co., Ltd., of Kyoto, Japan, manufactures and markets hardware and software for its Nintendo Switch™ system and the Nintendo 3DS™ family of portable systems. Since 1983, when it launched the Nintendo Entertainment System™, Nintendo has sold billions of video games and hundreds of millions of  hardware units globally, including Nintendo Switch and the Nintendo 3DS family of systems, as well as the Game Boy™, Game Boy Advance, Nintendo DS™ family of systems, Super NES™, Nintendo 64™, Nintendo GameCube™, Wii™, and Wii U™ systems. It has also created industry icons that have become well-known, household names, such as Mario, Donkey Kong, Metroid, Zelda and Pokémon. A wholly owned subsidiary, Nintendo of America Inc., based in Redmond, Wash., serves as headquarters for Nintendo’s operations in the Americas. For more information about Nintendo, please visit the company’s website at http://www.nintendo.com.

  Nintendo is an equal opportunity employer. We offer a welcoming and inclusive environment in service to one another, our products, the diverse consumers we represent, and the communities we call home. We do all of this with kindness, empathy and respect for each other.

  This team is focused on middleware, working primarily with AWS Serverless technologies to provide a data integration platform for global Nintendo systems.",
  location: "Redmond, Virginia, United States",
  role: ROLE[2],
  level: LEVEL[2],
  post_url: "https://careers.nintendo.com/job-openings/listing/210000005Q.html?src=CWS-10000",
  status: STATUS[0],
  remote: true,
  goal: Goal.all.sample
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
  goal: Goal.all.sample
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
  goal: Goal.all.sample
)

Job.create!(
  company: "Twitch",
  description: "Are you interested in improving the creator experience at Twitch? Do you enjoy the challenge of building products with our customers? What about promoting important interactions with creators, especially around managing content, partner status, or identification? If so, you'd be a great fit for the Creator Business team. You'll report to the Engineering Manager for Creator and join a team to build products that solve and improve the lives of Twitch creators across the world.

  This position can be located in San Francisco, CA, Seattle, WA and New York, NY.",
  location: "San Franscisco, California, United States",
  role: ROLE[1],
  level: LEVEL[1],
  post_url: "https://www.twitch.tv/jobs/en/careers/5986892002/",
  status: STATUS[3],
  remote: true,
  goal: Goal.all.sample
)

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
