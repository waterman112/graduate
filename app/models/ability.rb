class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role_id: "1") # guest user
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end


# 这里的 User.new是新建一条记录的意思
# 但是在这里，我们并没有对这个新的记录传入任何的参数，
# 所以这个新纪录里面的东西，几乎都是nil
