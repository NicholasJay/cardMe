# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# # Examples:

# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)


# User.destroy_all
# Card.destroy_all
# Connection.destroy_all
# Group.destroy_all


# jessica = User.create(
#   email: "jessica@cardme.com",
#   first_name: "Jessica",
#   last_name: "S",
#   password: "1234",
#   password_confirmation: "1234"
#   )

# nick = User.create(
#   email: "nick@cardme.com",
#   first_name: "Nick",
#   last_name: "B",
#   password: "1234",
#   password_confirmation: "1234"
#   )

# sandy = User.create(
#   email: "sandy@cardme.com",
#   first_name: "Sandy",
#   last_name: "Sandy",
#   password: "1234",
#   password_confirmation: "1234"
#   )

# tai = User.create(
#   email: "tai@cardme.com",
#   first_name: "Tai",
#   last_name: "A",
#   password: "1234",
#   password_confirmation: "1234"
#   )

# dima = User.create(
#   email: "dima@cardme.com",
#   first_name: "Dima",
#   last_name: "Dima",
#   password: "1234",
#   password_confirmation: "1234"
#   )


# card1 = Card.create(card_name: "CardMe",
#     user: tai,
#     organization: "Bain & Company",
#     position:"developer",
#     phone_number: "832-276-6765"
#     )
# card2 = Card.create(card_name: "Freelance",
#     user: tai,
#     organization: "Accenture",
#     position:"leadperson",
#     phone_number: "913-355-5321"
#     )
# card3 = Card.create(card_name: "freelance",
#     user: nick,
#     organization: "Carnival",
#     position:"leadperson",
#     phone_number: "913-355-5321"
#     )

# card4 = Card.create(card_name: "freelance",
#     user: jessica,
#     organization: "Macy's",
#     position:"leadperson",
#     phone_number: "913-355-5321"
#     )


# Connection.create(user: tai , card: card3)
# Connection.create(user: tai , card: card4)





