module StoryUpdater
  def self.update
    puts "Updating stories..."

    sites = [
      :dailymail,
      :corriere,
      :nzz,
      :guardian,
      :elpais,
      :nyt,
      :lemonde,
      :asahi
    ].each { |e|
      puts "Crawling #{e}"
      begin
        item = Ecco::Crawler.new(e).crawl
        puts "Crawl of #{e} done"
        existing_article = Article.find_by(headline: item.headline)
        raise 'Article has not changed' unless existing_article == nil
        puts "Updating #{item.newspaper}"

        article = Article.new(newspaper: item.newspaper,
                       headline: item.headline,
                       description: item.description,
                       link: item.link,
                       image_url: item.image_url,
                       article: item.article)

        article.generate_translations
        article.save
      rescue Exception => ex
        puts "Failed to crawl/store #{e}: #{ex.message}"
      end
    }
    puts "done."
  end
end
