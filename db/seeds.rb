10.times.each do
  Post.create(title: Faker::Movie.title, body: Faker::Lorem.paragraph)
end