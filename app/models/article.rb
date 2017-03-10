class Article < ApplicationRecord

  def generate_translations
    language = EasyTranslate.detect(headline)
    puts "language is #{language}"
    unless language == "en"
      self.translated_headline = EasyTranslate.translate(self.headline, from: language, to: :en)
      self.translated_description = EasyTranslate.translate(self.description, from: language, to: :en)
      self.translated_article = EasyTranslate.translate(self.article, from: language, to: :en)
    end
  end

end
