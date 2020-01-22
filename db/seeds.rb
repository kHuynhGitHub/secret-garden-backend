require 'faker'

Bookcase.destroy_all
Book.destroy_all
User.destroy_all

imgs = [
  "assets/images/25a5ea0b96303756c3f3204b9feeaed8--programming-humor-stack-overflow.jpg",
  "assets/images/0354ce58a7a4308edcc46dd9238e12d7--programming-humor-software-development.jpg",
  "assets/images/136863.jpg",
  "assets/images/1787205.jpg",
  "assets/images/Cf7eHZ1W4AEeZJA.jpg",
  "assets/images/Cg0x8vnXEAEB2Le.jpg",
  "assets/images/lrg.jpg",
  "assets/images/lrg2.jpg"
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
