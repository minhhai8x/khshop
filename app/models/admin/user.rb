class Admin::User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  # check role of user
  def is?(requested_role)
    self.role == requested_role.to_s
  end
  
  #account_active?
  def active_for_authentication?
    super && account_active?
  end
  
  def account_active?
    self.status == 1
  end
  
end
