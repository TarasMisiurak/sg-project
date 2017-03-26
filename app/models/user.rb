class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.current
    Thread.current[:user]
  end      

  def self.current=(user)
    Thread.current[:user] = user
  end
end
