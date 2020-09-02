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