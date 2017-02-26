# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sites = [
  :dailymail,
  :repubblica,
  :nzz,
  :guardian,
  :elpais,
  :nyt,
  :lemonde
].map { |e| Ecco::Crawler.new(e).crawl }

sites.each do |item|
  existing_article = Article.find_by(headline: item.headline)
  if existing_article == nil
    Article.create(newspaper: item.newspaper,
                   headline: item.headline,
                   description: item.description,
                   link: item.link,
                   image_url: item.image_url)
  end
end

#binding.pry
