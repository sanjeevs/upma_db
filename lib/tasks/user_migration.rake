namespace :db do
  desc 'Create users for the website'
  task users: :environment do
    #Create users.
    admin = User.new(name: "sanjeev", email: "ssingh@steppress.org", password: "sohum1025", 
                        password_confirmation: "sohum1025")
    admin.toggle!(:admin)
    admin.save

    v1 = User.create!(name: "Vibha Chaitanya", email: "vibhachaitanya@yahoo.com", password: "harih om", 
                        password_confirmation: "harih om")

  end
end
