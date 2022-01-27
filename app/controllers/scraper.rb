require 'nokogiri'
require 'open-uri'

require_relative './titles.rb'

class Scraper

    def get_page(url)
        Nokogiri::HTML(URI.open(url[:url].to_s))
    end

    def get_reviews(url)
        review = self.get_page(url).css(".col-xs-12.mainReviews")
    end

    def make_reviews(url)
        self.get_reviews(url).each do |review|
   
           if review.css(".yes").text.to_s == "Yes"
               closed = true
           else
               closed = false
           end

            Review.create(
                title: review.css(".reviewTitle").text, 
                content: review.css(".reviewText").text, 
                author: review.css('p.consumerName > text()').text, 
                rating: review.css('div.numRec > text()').text, 
                date: review.css(".consumerReviewDate").text, 
                closed: closed, 
                loantype: review.css(".loanType")[0].text, 
                reviewtype: review.css(".loanType")[1].text,
                url: url[:url]
            )
        end
        Review.all.where(url: url[:url])
    end
end
