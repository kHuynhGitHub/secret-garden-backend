class Book < ApplicationRecord
  has_many :bookcases
  has_many :users, through: :bookcases
end

