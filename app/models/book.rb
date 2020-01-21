class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :bookcases
  has_many :users, through: :bookcases
end

