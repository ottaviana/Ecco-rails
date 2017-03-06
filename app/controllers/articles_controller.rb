class ArticlesController < ApplicationController
  def index
    @sites = [
       "The Guardian",
       "The Daily Mail",
       "Le Monde",
       #"New York Times",
       "Neue Zürcher Zeitung",
       "Corriere della Sera",
       "El País"
    ].map { |o|
      Article.order(created_at: :desc).find_by(newspaper: o)
    }
    # @sites = Article.order(created_at: :desc)
 end
 def show
   @article = Article.find(params[:id])
 end
end
