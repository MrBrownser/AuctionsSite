# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users creation
(1..20).each do |it|
	User.create(
		email: Faker::Internet::email,
		name: Faker::Internet::user_name
		)
end

# Itemauctions creation
users = User.all

users.each do |user|
	if (user.id%5 == 0)
		Itemauction.create(
			user_id: user.id,
			name: Faker::Commerce.product_name,
			category: "Electronics",
			img_link: "http://lorempixel.com/400/400/technics",
			description: Faker::Hacker.say_something_smart,
			end_date: Faker::Date.forward(60),
			starting_price: Faker::Commerce.price
 			)
	elsif (user.id%7 == 0)
		Itemauction.create(
			user_id: user.id,
			name: Faker::Commerce.product_name,
			category: "Home & garden",
			img_link: "http://lorempixel.com/400/400/sports",
			description: Faker::Company.catch_phrase,
			end_date: Faker::Date.forward(60),
			starting_price: Faker::Commerce.price
 			)
	end
end

# Bids creation
items = Itemauction.all

items.each do |item|
	Faker::Number.digit.to_i.times do |it|
		item_bids = Itembid.where(itemauction_id: item.id)
		if item_bids.empty?
			last_amount = item.starting_price
		else
			last_amount = item_bids.order("amount DESC").first.amount
		end
		# To create a random valid user:
		# 1. We create an array with all user id's
		users_id_arr = User.pluck(:id)
		# 2. Remove the owner of the item
		users_id_arr.delete(item.user_id)
		# 3. Pick one randomly
		rand_user = User.find(users_id_arr.sample)

		Itembid.create(
				amount: last_amount + Faker::Number.digit.to_f,
				itemauction_id: item.id,
				user_id: rand_user
				)
	end
end