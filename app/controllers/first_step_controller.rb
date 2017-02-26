class FirstStepController < ApplicationController
  def index
    #  @sites = [
    #    Ecco::Crawler.new(:dailymail).crawl,
    #    Ecco::Crawler.new(:repubblica).crawl,
    #    Ecco::Crawler.new(:nzz).crawl
    #  ]

     @sites = [
       :dailymail,
       :repubblica,
       :nzz,
       :guardian,
       :elpais,
       :nyt
     ].map { |e| Ecco::Crawler.new(e).crawl }


  end
end
