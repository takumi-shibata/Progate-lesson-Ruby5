# 継承(jsと似ている、詳しくはjs4のリポジトリ参照)
# 「class 新しいクラス名(大文字) < 元となる大文字クラス名(大文字)」とすることで元となるクラスを継承して、新しいクラスを定義することができる。新しいクラスは「子クラス」、元となるクラスは「親クラス」となる
require "./menu"

class Food < Menu  
end



# 子クラス独自のインスタンス変数の追加
require "./menu"

class Food < Menu
  # ↓「calorie」というFoodクラス独自のインスタンス変数の追加
  attr_accessor :calorie
end



# 子クラス独自のインスタンスメソッドの追加
require "./menu"

class Food < Menu
  attr_accessor :calorie
  
  # ↓「calorie_info」というFoodクラス独自のメソッドを定義
  def calorie_info
    return "#{self.name}は#{self.calorie}kcalです"
  end
end



# オーバーライド(親クラスと同じ名前のメソッドを子クラスに定義すると、子クラスのメソッドが優先して使用される。jsと似ている、詳しくはjs4のリポジトリ参照)
require "./menu"

class Food < Menu
  attr_accessor :calorie
  
  # ↓オーバーライド
  def info
    return "#{self.name} #{self.price}円 (#{self.calorie}kcal)"
  end
  
  def calorie_info
    return "#{self.name}は#{self.calorie}kcalです"
  end
end



# initializeメソッドのオーバーライド
require "./menu"

class Food < Menu
  attr_accessor :calorie
  
  # ↓initializeメソッドのオーバーライド: 子クラス(Food)のinitializeメソッドが優先されるため、calorieだけでなく「name」や「price」の定義も当然必要
  def initialize(name:, price:, calorie:)
    self.name = name
    self.price = price
    self.calorie = calorie
  end
  
  def info
    return "#{self.name} #{self.price}円 (#{self.calorie}kcal)"
  end
  
  def calorie_info
    return "#{self.name}は#{self.calorie}kcalです"
  end
end



# super(オーバーライドする親のメソッドが引数を持つとき、オーバーライドしたメソッドの中で「super」とすることで、親クラスの同名のメソッドを呼び出すことがでる。jsと似ている、詳しくはjs4のリポジトリ参照)
require "./menu"

class Food < Menu
  attr_accessor :calorie
  
  def initialize(name:, price:, calorie:)
    # ↓super
    super(name: name, price: price)
    self.calorie = calorie
  end
  
  def info
    return "#{self.name} #{self.price}円 (#{self.calorie}kcal)"
  end
  
  def calorie_info
    return "#{self.name}は#{self.calorie}kcalです"
  end
end