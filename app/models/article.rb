class Article < ApplicationRecord

  @@ALGOLIA_INDEX_NAME = "dev_article"

  after_create :index_to_algolia
  after_destroy :remove_from_algolia

  def generate_translations
    language = EasyTranslate.detect(headline)
    puts "language is #{language}"
    unless language == "en"
      self.translated_headline = EasyTranslate.translate(self.headline, from: language, to: :en)
      self.translated_description = EasyTranslate.translate(self.description, from: language, to: :en)
      self.translated_article = EasyTranslate.translate(self.article, from: language, to: :en)
    end
  end

  def serialize_algolia
    {
      objectID: self.id,
      newspaper: self.newspaper,
      headline: self.headline,
      description: self.description,
      link: self.link,
      image_url: self.image_url,
      article: self.article
    }
  end

  def self.algolia_import

    index = Algolia::Index.new(@@ALGOLIA_INDEX_NAME)
    index.add_objects(Article.all.map(&:serialize_algolia))
  end

  def index_to_algolia
    index = Algolia::Index.new(@@ALGOLIA_INDEX_NAME)
    index.save_object(self.serialize_algolia)
  end

  def remove_from_algolia
    index = Algolia::Index.new(@@ALGOLIA_INDEX_NAME)
    index.delete_object(self.id)
  end



end
