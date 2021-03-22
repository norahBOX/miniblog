class Post < ApplicationRecord
  belongs_to :user #validation 
  has_many :comments, dependent: :destroy

end