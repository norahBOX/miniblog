class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: true } # 대소문자 구문
  validates :name, presence: true
  validates :phone, presence: true 
  validates :phone, uniqueness: true 
  validates :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: true }
  validates :slug, format: { with: /\A([a-z]+)([a-z0-9_]+)\z/, message: "영문소문자, 숫자, _만 허용, 영문소문자로 시작하도록 작성" }  



end
