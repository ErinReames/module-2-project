# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Counts
user_count = 10
store_count = 5
pet_count = 25
appointment_count = 35
review_count = 25


# Delete Old Seeds
User.destroy_all
Store.destroy_all
Pet.destroy_all
Appointment.destroy_all
Review.destroy_all

# User Seeds
user_count.times do 
    username = Faker::Name.name
    address = Faker::Address.full_address
    phone = Faker::PhoneNumber.phone_number
    password = "password"
    User.create(username: username, address: address, phone: phone, password: password, password_confirmation: password)
end

# User Seeds (Admin Account)
username = "admin"
address = Faker::Address.full_address
phone = Faker::PhoneNumber.phone_number
password = "admin"
User.create(username: username, address: address, phone: phone, password: password, password_confirmation: password)

# Store Seeds
store_count.times do
    name = Faker::Company.name
    address = Faker::Address.full_address
    Store.create(name: name, address: address)
end

# Pet Seeds
pet_count.times do
    name = Faker::Creature::Dog.name
    species = "Dog"
    breed = Faker::Creature::Dog.breed
    age = Faker::Number.within(range: 1..15)
    weight = Faker::Number.within(range: 1..100)
    disposition = Faker::Hipster.sentence
    special_need = "None"

    # Pull pet picture_url from Dog API
    uri = URI.parse("https://dog.ceo/api/breeds/image/random")
    response = Net::HTTP.get_response(uri)
    picture_url = JSON.parse(response.body)["message"]
    
    store_id = Store.all.sample.id
    Pet.create(name: name, species: species, breed: breed, age: age, weight: weight, disposition: disposition, special_need: special_need, picture_url: picture_url, store_id: store_id)
end

# Appointment Seeds
appointment_count.times do
    check_out = Faker::Date.between(from: (DateTime.now - 90.days), to: (DateTime.now + 90.days))
    check_in = check_out + rand(1..7)
    user_id = User.all.sample.id
    pet_id = Pet.all.sample.id
    Appointment.create(check_out: check_out, check_in: check_in, user_id: user_id, pet_id: pet_id)
end

# Review Seeds
review_count.times do
    title = Faker::Creature::Dog.meme_phrase.capitalize
    content = Faker::Hipster.paragraph
    rating = rand(1..5)
    user_id = User.all.sample.id
    pet_id = Pet.all.sample.id
    Review.create(title: title, content: content, rating: rating, user_id: user_id, pet_id: pet_id)
end