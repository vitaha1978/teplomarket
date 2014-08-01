namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Admin",
      email: "admin2222222@teplomarket44.com.ua",
                         password: "Vini_2306",
                         password_confirmation: "Vini_2306",
                         admin: true)
    
    
  end
  
end