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
unless User.find_by(email: "sss@sss")
  User.create!(
    name: "sss",
    email: "sss@sss",
    password: "ssssss",
    postal_code: "0000000",
    address: "東京都渋谷区",
    phone: "00000000"
  )
end

unless User.find_by(id: 20)
  20.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "テスト太郎#{n + 1}",
      password: "testtest",
      postal_code: "0000000",
      address: "東京#{n + 1}区",
      phone: "00000000"
    )
  end
end

unless Studio.find_by(id: 3)
  3.times do |n|
    Studio.create!(
      name: "第#{n}スタジオ",
      weekday_fee: 1000 + (n * 100),
      weekend_fee: 1200 + (n * 100),
      area: 10 + (n * 2)
    )
  end
end

unless EquipmentGenre.find_by(id: 4)
  EquipmentGenre.create!([
    {name: "鍵盤"},
    {name: "アンプ"},
    {name: "ドラム"},
    {name: "その他"}
  ])
end

Studio.all.each do |n|
  Equipment.create!([
    {name: "YAMAHA U-3", studio_id: n.id, equipment_genre_id: 1},
    {name: "GK MB150S-III112", studio_id: n.id, equipment_genre_id: 2},
    {name: "SONAR Select Force Jungle", studio_id: n.id, equipment_genre_id: 3},
    {name: "CD-RW900MK2", studio_id: n.id, equipment_genre_id: 4}
  ])
end

PaidEquipment.create!([
  {name: "Roland JC-120", equipment_genre_id: 2, fee: 200},
  {name: "Gliga Gems II(コントラバス)", equipment_genre_id: 4, fee: 300},
  {name: "SM-58", equipment_genre_id: 4, fee: 100},
  {name: "Canopus Neo Vintage セット", equipment_genre_id: 3, fee: 500}
])

