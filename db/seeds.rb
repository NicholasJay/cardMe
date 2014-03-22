# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(
  email: "joe1@joey.com",
  first_name: "Joe1",
  last_name: "Joey",
  password: "1234",
  password_confirmation: "1234"
  )

User.create(
  email: "joe2@joey.com",
  first_name: "Joe2",
  last_name: "Joey",
  password: "1234",
  password_confirmation: "1234"
  )

User.create(
  email: "joe3@joey.com",
  first_name: "Joe3",
  last_name: "Joey",
  password: "1234",
  password_confirmation: "1234"
  )
User.create(
  email: "joe4@joey.com",
  first_name: "Joe3",
  last_name: "Joey",
  password: "1234",
  password_confirmation: "1234"
  )
User.create(
  email: "joe5@joey.com",
  first_name: "Joe3",
  last_name: "Joey",
  password: "1234",
  password_confirmation: "1234"
  )

Card.create(card_name: "freelance",
    organization: "business1",
    position:"leadperson",
    phone_number: "913-355-5321"
    )
Card.create(card_name: "freelance",
    organization: "business2",
    position:"leadperson",
    phone_number: "913-355-5321"
    )
Card.create(card_name: "freelance",
    organization: "business3",
    position:"leadperson",
    phone_number: "913-355-5321"
    )
Card.create(card_name: "freelance",
    organization: "business4",
    position:"leadperson",
    phone_number: "913-355-5321"
    )
Card.create(card_name: "freelance",
    organization: "business5",
    position:"leadperson",
    phone_number: "913-355-5321"
    )
Card.create(card_name: "freelance",
    organization: "business6",
    position:"leadperson",
    phone_number: "913-355-5321"
    )
Card.create(card_name: "freelance",
    organization: "business7",
    position:"leadperson",
    phone_number: "913-355-5321"
    )

Connection.create(user_id: 1, card_id: 3)
Connection.create(user_id: 1, card_id: 4)
Connection.create(user_id: 1, card_id: 5)
Connection.create(user_id: 1, card_id: 6)
Connection.create(user_id: 2, card_id: 7)
Connection.create(user_id: 3, card_id: 7)
Connection.create(user_id: 2, card_id: 7)
Connection.create(user_id: 4, card_id: 7)
Connection.create(user_id: 4, card_id: 7)
Connection.create(user_id: 5, card_id: 7)





