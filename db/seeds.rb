# Seed Users
user = {}
user['password'] = 'asdf'


ActiveRecord::Base.transaction do
  20.times do 

    user['email'] = Faker::Internet.email
    user['password'] = Faker::Internet.password
    user['role'] = rand(0..1)
    user['username'] = Faker::App.name
    user['first_name'] = Faker::Name.first_name
    user['last_name'] = Faker::Name.last_name 
    user['gender'] = ["Female", "Male"].sample
    user['phone'] = Faker::PhoneNumber.phone_number
    user['country'] = Faker::Address.country


    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['user_id'] = uids.sample
    listing['country'] = Faker::Address.country
    listing['state'] = Faker::Address.state
    listing['city'] = Faker::Address.city
    listing['postcode'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['room_number'] = rand(0..5)
    listing['bed_number'] = rand(1..6)
    listing['guest_number'] = rand(1..10)
    listing['tags'] = ["Smoking", "Kitchen", "Cooking", "Hair dryer", "Laundry", "Bath tub", "Wi-fi", "Public transport", "Gym room", "Swimming pool", "Sauna", "View", "Air conditioning"].sample
    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence

    Listing.create(listing)
  end
end

#Seed Reservations
reservation = {}
uids = []
listing_id = []
User.all.each { |u| uids << u.id}
Listing.all.each {|l| listing_id << l.id}
ActiveRecord::Base.transaction do
  30.times do 
    reservation['check_in'] = rand(0..1)
    reservation['check_out'] = rand(0..1)
    reservation['check_in_date'] = Faker::Date.forward(23)
    reservation['check_out_date'] = Faker::Date.forward(30)
    reservation['book_guest_number'] = rand(1..10)
    reservation['memo'] = Faker::Hipster.sentence
    reservation['paid'] = rand(0..1)

    Reservation.create(reservation)
  end
end
