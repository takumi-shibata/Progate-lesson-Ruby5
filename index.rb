# 継承したクラスの使用(jsと似ている、詳しくはjs4のリポジトリ参照)
require "./food"
require "./drink"

food1 = Food.new(name:"ピザ",price:800)
drink1 = Drink.new(name:"コーラ",price:300)

puts food1.info
puts drink1.info
# →ピザ:800円 コーラ:300円



# 子クラス独自のインスタンス変数の追加
require "./food"
require "./drink"

food1 = Food.new(name: "ピザ", price: 800)
drink1 = Drink.new(name: "コーラ", price: 300)

food1.calorie = 700
drink1.amount = 500

puts food1.calorie
puts drink1.amount
# →700 500



# 子クラス独自のインスタンスメソッドの追加
require "./food"
require "./drink"

food1 = Food.new(name: "ピザ", price: 800)
food1.calorie = 700

puts food1.calorie_info
# →ピザは700kcalです