class ArticlesController < ApplicationController
  def index
    names = [
       "The Guardian",
       "The Daily Mail",
       "Le Monde",
       #"New York Times",
       "Neue Zürcher Zeitung",
       "Corriere della Sera",
       "El País",
       "The Asahi Shimbun",
       "Frankfurter Allgemeine",
       "NRC",
       "Kommersant",
       "Dagens Nyheter",
       "Aftenposten",
       "Cumhuriyet",
       "Independent",
       "Wienerzeitung",
       "Protothema",
       "Diario de Noticias",
       "Morocco World News",
       "Berlingske",
       "Fakt",
       "Adevarul"
    ]
    @sites = []
    names.each { |n|
      tmp = Article.order(created_at: :desc).find_by(newspaper: n)
      if tmp != nil
        @sites = @sites + [tmp]
      end
    }
  end

  def show
    @article = Article.find(params[:id])
    if params[:translated]
      @translated = true
    else
      @translated = false
    end
  end

  def sport
    names = [
       "La Gazzetta dello sport",
       "L'ÉQUIPE",
       "SPORT",
       "Sports Illustrated",
       "Sport Allgemein",
       "Sport.ch",
       "Sky Sport",
       "Sport Express",
       "Japan Sport"
    ]
    @sites = []
    names.each { |n|
      tmp = Article.order(created_at: :desc).find_by(newspaper: n)
      if tmp != nil
        @sites = @sites + [tmp]
      end
    }
  end

  def economy
    names = [
       "Il sole",
       "Financial Times",
       "Bloomberg",
       "Forbes US",
       "Forbes EU",
       "Expansion"
    ]
    @sites = []
    names.each { |n|
      tmp = Article.order(created_at: :desc).find_by(newspaper: n)
      if tmp != nil
        @sites = @sites + [tmp]
      end
    }
  end

  def search_results
    @sites = params[:id].split(",").map {|id| Article.find(id)}
  end


end
