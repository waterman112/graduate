class Count < ActiveRecord::Base

  before_save :say_hi

  # 这个方法是隐形的。 定义于： ActiveRecord::Base 中。
  def save
  end

  def say_hi
    puts "=== hihihi"
  end
end
