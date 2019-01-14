# Seed Users
user = {}
user['password'] = 'asdf'


ActiveRecord::Base.transaction do
  20.times do 

    user['email'] = Faker::Internet.email
    user['password'] = Faker::Internet.password
    user['role'] = rand(0..1)


    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['ratings'] = rand(1..5)
    listing['states'] = Faker::Address.state
    listing['postcode'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address
    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end