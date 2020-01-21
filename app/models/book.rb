class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :books_users
  has_many :users, through: :books_users
end

