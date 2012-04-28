

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = Member.create!(:name => "Truc Pham",
                 :email => "trucsphamj@yahoo.com",
                 :password => "123456",
                 :password_confirmation => "123456")  
    admin.toggle!(:admin)  
    0.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Member.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    Member.all(:limit => 6).each do |member|
      0.times do
        member.nags.create!(:content => Faker::Lorem.sentence(5))
      end
    end   
  end
end