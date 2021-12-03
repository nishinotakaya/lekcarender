# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name: "A",
#               email: "sample@email.com",
#               password: "6688",
#               password_confirmation: "6688"
#             )


user = User.create!(name: "User Name", id: 5)
user.tasks.create!(total: "16 国分北海道")
user.tasks.create!(total: "21 国分東北")
user.tasks.create!(total: "0A 国分関信越")
user.tasks.create!(total: "0K 国分首都圏")
user.tasks.create!(total: "08 FS事業部")
user.tasks.create!(total: "51: 国分中部")
user.tasks.create!(total: "4F: 国分西日本")
user.tasks.create!(total: "6B: 国分九州")
user.tasks.create!(total: "80: 国分商品開発部")
user.tasks.create!(total: "0W: KFC")
user.tasks.create!(total: "2W: KFC")
user.tasks.create!(total: "5W: KFC")
user.tasks.create!(total: "4G: KFC西日本")
user.tasks.create!(total: "4H: クサヤ")
user.tasks.create!(total: "P0: ヤマキ")
user.tasks.create!(total: "P2: 宮崎酒場")
user.tasks.create!(total: "0V: ナックス")
user.tasks.create!(total: "07: 流通事業部")


user_a = User.create!(name: "User Name2", email: "takaya@email.com", id: 6)
user_a.tasks.create!(classification: "機能強化")
user_a.tasks.create!(classification: "業務改善")
user_a.tasks.create!(classification: "改廃案件")
user_a.tasks.create!(classification: "物流協業")
user_a.tasks.create!(classification: "内部改廃")


puts "all_user"
