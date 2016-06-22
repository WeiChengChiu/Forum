namespace :dev do

  task :fake => :environment do
    puts "Fake data..."

    10.times do |u|
      User.create!( :email => Faker::Internet.email, :password => "12345678" )
    end

    users = User.all

    100.times do |i|
      puts "Generate topic #{i}"
      t = Topic.create( :title => Faker::Lorem.word, :content => Faker::Lorem.paragraph, :user => users.sample )

      10.times do |j|
        puts "Generate comment #{j}"
        t.comments.create( :content => Faker::Lorem.paragraph, :user => users.sample )
      end
    end

  end

end
