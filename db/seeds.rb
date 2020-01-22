require 'faker'

Bookcase.destroy_all
Book.destroy_all
User.destroy_all

imgs = [
  "assets/images/cover1.jpg",
  "assets/images/cover2.jpg",
  "assets/images/cover3.jpg",
  "assets/images/cover4.jpg",
  "assets/images/cover5.jpg",
  "assets/images/cover6.jpg",
  "assets/images/cover7.jpg",
  "assets/images/cover8.jpg"
]

50.times do
  Book.create(
    title: Faker::Book.title,
    description: Faker::TvShows::DrWho.quote,
    cover_image: imgs.sample,
    author: Faker::Book.author,
    publisher: Faker::Book.publisher,
    page_count: Faker::Number.within(range: 100..1000),
    genre: Faker::Book.genre
  )
end

5.times do
  User.create(
    username: Faker::Name.first_name
  )
end

# prep for bookcases
books = Book.all
users = User.all

20.times do
  Bookcase.create(
    book_id: books.sample.id,
    user_id: users.sample.id
  )
end

# 50.times do
#   Author.create(
#     name: Faker::Book.author
#   )
# end

# 50.times do
#   Publisher.create(
#     name: Faker::Book.publisher
#   )
# end
