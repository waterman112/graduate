class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def eat
    Rails.logger.info "== begin eating ..."
    sleep 2
    Rails.logger.info "== finished ..."
  end
end
