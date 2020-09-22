class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cocktails, dependent: :destroy
  has_one_attached :photo

  def avatar_url
    photo.present? ? photo.key : 'default'
  end
end
