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
end



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
    # ↓戻り値で日曜日であればtrue、そうでなければfalseを返す処理   
    return today.sunday?
  end
end



# クラスメソッドの呼び出し(※インスタンスメソッド内で呼び出す事ができる)
# ※インスタンスメソッドはインスタンスに対して呼び出す→(例)インスタンスを生成した変数名.メソッド名。 クラスメソッドはクラスに対して呼び出す→(例)クラス名.メソッド名
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
    
    # ↓インスタンスメソッド内でクラスメソッドの呼び出し
    if count >= 1 && Menu.is_discount_day? == true # ←数量が「1以上」かつ、クラスメソッドの処理で「今日の日付が日曜日(true)」ならば合計金額から100円引き
      total_price -= 100
    end
    return total_price
  end
  
  def Menu.is_discount_day?
    today = Date.today
    return today.sunday?
  end
end