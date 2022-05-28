class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :resources
  has_many :goals
  has_many :jobs, through: :goals
  has_many :views
  has_many :resources, through: :views

  def viewed?(resource)
    views.any? do |view|
      view.resource == resource
    end
  end
end
