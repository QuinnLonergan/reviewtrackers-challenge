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
            puts "REVIEW STARTING:"
            puts review.css(".reviewTitle").text
            puts review.css(".reviewText").text
            puts review.css('p.consumerName > text()').text
            puts review.css('div.numRec > text()').text
            puts review.css(".consumerReviewDate").text
            puts review.css(".yes").text
            puts review.css(".loanType")[0].text
            puts review.css(".loanType")[1].text
        end
        "hello"
    end


end

# Review.create(
#     title: "test", 
#     content: "test", 
#     author: "test", 
#     rating: 5, 
#     date: "test", 
#     closed: true, 
#     loantype: "test", 
#     reviewtype: "test")