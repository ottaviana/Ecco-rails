class FirstStepController < ApplicationController
  def index

    #  @sites = [
    #    :dailymail,
    #    :repubblica,
    #    :nzz,
    #    :guardian,
    #    :elpais,
    #    :nyt,
    #    :lemonde
    #  ].map { |e| Ecco::Crawler.new(e).crawl }

    # @sites = [ Article.find_by(newspaper: "The Guardian") ]
    # @sites = Article.all

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
end
