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



# オーバーライド(親クラスと同じ名前のメソッドを子クラスに定義すると、子クラスのメソッドが優先して使用される。jsと似ている、詳しくはjs4のリポジトリ参照)
require "./food"
require "./drink"

food1 = Food.new(name: "ピザ", price: 800)
food1.calorie = 700
food2 = Food.new(name: "すし", price: 1000)
food2.calorie = 600
drink1 = Drink.new(name: "コーラ", price: 300)
drink1.amount = 500
drink2 = Drink.new(name: "お茶", price: 200)
drink2.amount = 400

menus = [food1, food2, drink1, drink2]

index = 0
menus.each do |menu|
  # ↓オーバーライド: menu.infoの「info」は子クラス(FoodとDrinkクラス)のinfoメソッドが優先される
  puts "#{index}. #{menu.info}"
  index += 1
end

puts "--------------"
puts "メニューの番号を選択してください"
order = gets.chomp.to_i

selected_menu = menus[order]
puts "選択されたメニュー: #{selected_menu.name}"

puts "個数を入力してください(3つ以上で100円割引)"
count = gets.chomp.to_i

puts "お会計は#{selected_menu.get_total_price(count)}円です"
# →0. ピザ 800円(700kcal)  1. すし 1000円(600kcal) 2. コーラ 300円(500ml) 3. お茶 200円(400ml) --------------



# initializeメソッドのオーバーライド
require "./food"
require "./drink"

# ↓initializeメソッドのオーバーライド: 子クラス(FoodとDrinkクラス)のinitializeメソッド
food1 = Food.new(name: "ピザ", price: 800, calorie: 700)
food2 = Food.new(name: "すし", price: 1000, calorie: 600)
drink1 = Drink.new(name: "コーラ", price: 300, amount: 500)
drink2 = Drink.new(name: "お茶", price: 200, amount: 400)

menus = [food1, food2, drink1, drink2]

index = 0
menus.each do |menu|
  puts "#{index}. #{menu.info}"
  index += 1
end

puts "--------------"
puts "メニューの番号を選択してください"
order = gets.chomp.to_i

selected_menu = menus[order]
puts "選択されたメニュー: #{selected_menu.name}"

puts "個数を入力してください(3つ以上で100円割引)"
count = gets.chomp.to_i

puts "お会計は#{selected_menu.get_total_price(count)}円です"



# Dateクラス(DateクラスとはRubyがすでに用意しているクラスで、日付を扱う時に用いる)
# ↓「require」を用いてDateクラスを読み込むことで、クラスを定義しなくても使うことができる(※すでに用意されているクラスは、requireの書き方が少し異なるので注意！)
require "date" # ←(※"./dateではないことに注意")

# ↓今まで扱ってきたクラスと同様「クラス名.new」とすることでインスタンスを生成することができる(※引数に年,月,日を渡してインスタンスを生成)
birthday = Date.new(1996, 3, 1)
puts birthday
# →1996-03-01

# ↓Dateクラスのインスタンスメソッド:「sunday?」
#「sunday?」とはDateクラスのインスタンスの日付が、「日曜日かどうか」を真偽値で返すメソッド(合っていたらtrue、間違っていたらfalse)
puts birthday.sunday?
# →false



# ↓「Date.today」今日の日付のインスタンスをつくることができる
today = Date.today
puts today
# →2020-09-29



# クラスメソッド(クラスに対して呼び出すメソッド)
#「def クラス名.メソッド名 end」とすることで定義できる

# ↓Dateクラスを読み込み
require "date"

class Menu
  attr_accessor :name
  attr_accessor :price

  def initialize(name:, price:)
    self.name = name
    self.price = price
  end
  
  def info
    return "#{self.name} #{self.price}円"
  end
  
  def get_total_price(count)
    total_price = self.price * count
    if count >= 3
      total_price -= 100
    end
    return total_price
  end
  
  # ↓クラスメソッド
  def Menu.is_discount_day?

    # ↓「Date.today」今日の日付のインスタンスをつくることができる
    today = Date.today

    # ↓Dateクラスのインスタンスメソッド:「sunday?」
    # ↓戻り値で今日の日付が日曜日であればtrue、そうでなければfalseを返す処理   
    return today.sunday?
  end
end