# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "A",
              email: "sample@email.com",
              password: "6688",
              password_confirmation: "6688"
            )


#会計初期値
user = User.create!(id: 100, name: "User Name", email: "total@emaoil.com")
user.tasks.create!(total: "16: 国分北海道", classification: "")
user.tasks.create!(total: "21: 国分東北",classification: "")
user.tasks.create!(total: "0A: 国分関信越",classification: "")
user.tasks.create!(total: "0K: 国分首都圏",classification: "")
user.tasks.create!(total: "08: FS事業部",classification: "")
user.tasks.create!(total: "51: 国分中部",classification: "")
user.tasks.create!(total: "4F: 国分西日本",classification: "")
user.tasks.create!(total: "6B: 国分九州",classification: "")
user.tasks.create!(total: "80: 国分商品開発部",classification: "")
user.tasks.create!(total: "0W: KFC",classification: "")
user.tasks.create!(total: "2W: KFC",classification: "")
user.tasks.create!(total: "5W: KFC",classification: "")
user.tasks.create!(total: "4G: KFC西日本",classification: "")
user.tasks.create!(total: "4H: クサヤ",classification: "")
user.tasks.create!(total: "P0: ヤマキ",classification: "")
user.tasks.create!(total: "P2: 宮崎酒場",classification: "")
user.tasks.create!(total: "0V: ナックス",classification: "")
user.tasks.create!(total: "07: 流通事業部",classification: "")


#分類初期値
user_a = User.create!(id: 200, name: "User Name2", email: "classification@email.com")
user_a.tasks.create!(classification: "機能強化", total: "")
user_a.tasks.create!(classification: "業務改善", total: "")
user_a.tasks.create!(classification: "改廃案件", total: "")
user_a.tasks.create!(classification: "物流協業", total: "")
user_a.tasks.create!(classification: "内部改廃", total: "")


puts "all_user"
