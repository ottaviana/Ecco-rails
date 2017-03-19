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
       "The Asahi Shimbun"
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
end
