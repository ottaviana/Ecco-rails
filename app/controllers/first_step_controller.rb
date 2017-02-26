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
    @sites = Article.all 
  end
end
