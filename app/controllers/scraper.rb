require 'nokogiri'
require 'open-uri'

class Scraper

    def get_page
        Nokogiri::HTML(URI.open("https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183"))
    end

    def get_reviews
        self.get_page.css(".col-xs-12.mainReviews")
    end

    def make_reviews
        self.get_reviews.each do |review|
            puts "hi"
            # review.css(".reviewTitle").text.strip
        end
    end


end
