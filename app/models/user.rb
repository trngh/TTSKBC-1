class User < ApplicationRecord


  belongs_to :role
  has_many :e_registrations
  has_many :events
  has_many :reviews
  has_many :events, through: :reviews
  has_many :e_joins
  has_many :events, through: :e_joins #user tham gia nhieu event thong qua join
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def guest?
    role.name == "Guest"
  end
  def admin?
    role.name == "Admin"
  end
end
