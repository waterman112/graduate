class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 关联的时候，需要注意的是，关联模型之间需要额外的添加一列外键
  # 因为经常会忘记，所以这里特别指出来
  #
  belongs_to :role

  #这段代码看的是外国人的一个应用商店的教程写的
  #和原来的代码关联性不大
  validates_presence_of :name

  #这里做的是存储工作，但是我并没有做存储工作
  #我只是希望判断正在浏览的用户的角色是什么.
  before_validation :assign_role


  #自己写的self.role.name 因为user and role 是关联关系
  #所以self.role 得到的是role模型，
  #self.role.name 得到的是name字段
  #
  def admin?
    if self.role.name == nil
      self.role.name = "Regular"
    else
      self.role.name == "Admin"
    end
  end

  def seller?
    self.role.name == "Seller"
  end

  def regular?
    self.role.name == "Regular"
  end

  protected
  def assign_role
   # Rails.logger.debug.
   # Rails.logger.info
    #puts "this is from user.rb__assign_role__"
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  #def eat
  #  Rails.logger.info "== begin eating ..."
  #  sleep 2
  #  Rails.logger.info "== finished ..."
  #end
  #
end
