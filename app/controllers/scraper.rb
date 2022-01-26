require 'nokogiri'
require 'open-uri'

require_relative './titles.rb'

class Scraper

    def get_page
        Nokogiri::HTML(URI.open("https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183"))
    end

    def get_reviews
        review = self.get_page.css(".col-xs-12.mainReviews")
    end

    def make_reviews
        self.get_reviews.each do |review|
            puts review.css(".reviewTitle").text
            
        end
        "hello"
    end


end
