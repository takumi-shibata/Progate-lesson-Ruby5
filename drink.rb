# 継承(jsと似ている、詳しくはjs4のリポジトリ参照)
# 「class 新しいクラス名(大文字) < 元となる大文字クラス名(大文字)」とすることで元となるクラスを継承して、新しいクラスを定義することができる。新しいクラスは「子クラス」、元となるクラスは「親クラス」となる
require "./menu"

class Drink < Menu  
end



# 子クラス独自のインスタンス変数の追加
require "./menu"

class Drink < Menu
  # ↓「amount」というDrinkクラス独自のインスタンス変数の追加
  attr_accessor :amount
end



# オーバーライド(親クラスと同じ名前のメソッドを子クラスに定義すると、子クラスのメソッドが優先して使用される。jsと似ている、詳しくはjs4のリポジトリ参照)
require "./menu"

class Drink < Menu
  attr_accessor :amount
  
  # ↓オーバーライド
  def info
    return "#{self.name} #{self.price}円 (#{self.amount}mL)"
  end  
end



# initializeメソッドのオーバーライド
# super(オーバーライドする親のメソッドが引数を持つとき、オーバーライドしたメソッドの中で「super」とすることで、親クラスの同名のメソッドを呼び出すことがでる。jsと似ている、詳しくはjs4のリポジトリ参照)
require "./menu"

class Drink < Menu
  attr_accessor :amount
  
  # ↓initializeメソッドのオーバーライド: 子クラス(Drink)のinitializeメソッドが優先される
  def initialize(name:, price:, amount:)
    # ↓super
    super(name: name, price: price)
    self.amount = amount
  end
  
  def info
    return "#{self.name} #{self.price}円 (#{self.amount}mL)"
  end
end