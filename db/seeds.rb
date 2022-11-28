# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Name of the spot
# latitude longitude
# equipment
# facilities

# example of user that creates a spot
user_details = {
  email: "jerome.lebart@hotmail.com",
  password: "123456",
  first_name: "Jerome",
  last_name: "lebart"
}
user = User.new(user_details)
user.save

# Example of a user that creates a review
user_review = {
  email: "bastien.albertine@hotmail.com",
  password: "123456",
  first_name: "Bastien",
  last_name: "Albertine"
}
user_2 = User.new(user_review)
user_2.save

# USER DETAILS CREATION OF THE ACTUAL SPOT
spot_details = {
  name: "SS Thistlegorm",
  latitude: 27.8137460146132,
  longitude: 33.92075717116466,
  equipment: "snorkling",
  facility: "restaurant",
  description: "Very nice spot had a blast!",
  user: user
}
spot = Spot.new(spot_details)
spot.save

# the review content
review_content = {
  centent: "One of the best skubadiving spots I've made", #fuckers you made a typo on schema by putting centent insted of content
  rating: 4,
  user: user_2,
  spot: spot
}
review = Review.new(review_content)
review.save
