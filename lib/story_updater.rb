module StoryUpdater
  def self.update(name)
    puts "Updating stories..."

    if name
      sites = [name]
    else
      sites = [
        :dailymail,
        :corriere,
        :nzz,
        :guardian,
        :elpais,
        :nyt,
        :lemonde,
        :asahi,
        :faz,
        :nrc,
        :kommersant,
        :dagensnyheter,
        :gazzetta,
        :equipe,
        :sportes,
        :aftenposten,
        :cumhuriyet,
        :independent,
        :ilsole,
        :wienerzeitung,
        :financialtimes,
        :bloomberg,
        :forbesus,
        :forbeseurope,
        :protothema,
        :dn,
        :morocco,
        :berlingske,
        :fakt,
        :adevarul,
        :sports_illustrated,
        :sport_allgemein,
        :sport_ch,
        :sky_sport,
        :sport_express,
        :japan_sport,
        :expansion
      ]
    end

    sites.each { |e|
      puts "Crawling #{e}"
      begin
        item = Ecco::Crawler.new(e).crawl
        puts "Crawl of #{e} done"
        existing_article = Article.find_by(newspaper: item.newspaper, headline: item.headline)
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
        if (ex.message != 'Article has not changed')
          puts "Failed to crawl #{e}: #{ex.message}"
          puts ex.backtrace.join("\n")
        else
          puts "Article has not changed so database entry was not touched"
        end
      end
    }
    puts "done."
  end
end
