require 'faker'

50.times do
  Book.create(
    title: Faker::Book.title,
    descripton: Faker::TvShows::DrWho.quote,
    cover_image: Faker::LoremFlickr.image(size: "50x60", search_terms: ['books']),
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

50.times do
  Author.create(
    name: Faker::Book.author
  )
end

50.times do
  Publisher.create(
    name: Faker::Book.publisher
  )
end
