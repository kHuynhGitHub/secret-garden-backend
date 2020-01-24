class User < ApplicationRecord
  # has_many :bookcases, lambda { order(:book_id => :asc) } # This also works; note the word 'lambda'.
  has_many :bookcases, -> { order(:book_id => :asc) }
  has_many :books, through: :bookcases

  # validations
  validates :username, {
    :presence => true,
    :length => 2..8,
    :allow_blank => false,
    :format => {:with => /\A(?=.*[a-z])[a-z\d]+\Z/i },
    :uniqueness => true
  }

end
