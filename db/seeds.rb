require 'faker'

50.times do
  Books.create(
    title: Faker::Book.title,
    descripton: Faker::TvShows::DrWho.quote,
    cover_image: Faker::LoremFlickr.image(size: "50x60", search_terms: ['books']),
    author: Faker::Book.author,
    publisher: Faker::Book.publisher,
    page_count: Faker::Number.within(range: 100..1000),
    genre: Faker::Book.genre
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
