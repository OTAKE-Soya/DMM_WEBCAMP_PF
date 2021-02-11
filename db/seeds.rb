# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Admin.find_by(id: 1)
  Admin.create!(
    email: "aaa@aaa",
    password: "aaaaaa",
    name: "aaaa"
  )
end

User.create!(
  name: "sss",
  email: "sss@sss",
  password: "ssssss",
  postal_code: "0000000",
  address: "東京都渋谷区",
)