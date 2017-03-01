class ArticlesController < ApplicationController
  def index
    @sites = [
       "The Guardian",
       "The Daily Mail",
       "Le Monde",
       "New York Times",
       "Neue Zürcher Zeitung",
       "Repubblica",
       "Le Monde",
       "El País"
    ].map { |o|
      Article.order(created_at: :desc).find_by(newspaper: o)
    }
 end
 def show
   @article = Article.find(params[:id])
 end
end
