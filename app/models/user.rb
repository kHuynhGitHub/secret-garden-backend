class User < ApplicationRecord
  # has_many :bookcases, lambda { order(:book_id => :asc) } # This also works; note the word 'lambda'.
  has_many :bookcases, -> { order(:book_id => :asc) }
  has_many :books, through: :bookcases
end
