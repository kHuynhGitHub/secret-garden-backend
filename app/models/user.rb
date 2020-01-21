class User < ApplicationRecord
  has_many :bookcases
  has_many :books, through: :bookcases
end
