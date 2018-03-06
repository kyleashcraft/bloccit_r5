class Post < ApplicationRecord
  has_many :comments, depdendent: :destroy 
end
