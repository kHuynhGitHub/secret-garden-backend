class User < ApplicationRecord
  has_many :books_users
  has_many :books, through: :books_users
end
