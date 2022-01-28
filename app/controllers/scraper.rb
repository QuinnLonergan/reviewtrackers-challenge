require 'nokogiri'
require 'open-uri'

class Scraper
    BASE_URL = "www.lendingtree.com/reviews"

    def initialize(url)
        @url = url[:url]
    end

    def valid_url?
        @url.include? BASE_URL
    end

    def get_page(page)
        if page == 1 
            url_page = (@url)
        elsif page > 1
            url_page = ("#{@url}?sort=\\&pid=#{page}")
        end 
        puts "HEY RIGHT HERE THE PAGE IS #{page}}"
        reviews = Nokogiri::HTML(URI.open(url_page))
    end

    def errors?
        !!@errors
    end


    def make_reviews
        begin
        page = 1


        reviews_num = self.get_page(page).css(".col-xs-12.mainReviews")
        per_page = reviews_num.count
        total = self.get_page(page).css(".start-rating-reviews").css(".hidden-xs").text.split[0].to_i
        last_page = (total.to_f / per_page.to_f).round()

        

        while page <= last_page
            reviews = self.get_page(page).css(".col-xs-12.mainReviews")
            reviews.each do |review|
   
                if review.css(".yes").text.to_s .== "Yes"
                    closed = true
                else
                    closed = false
                end


                # Some reviews don't have loantype and reviewtype, this is logic to prevent a 422 error.
                if review.css(".loanType")[0] && review.css(".loanType")[1]
                    loantype = review.css(".loanType")[0].text
                    reviewtype = review.css(".loanType")[1].text
                else
                    loantype = "N/A"
                    reviewtype = "N/A"
                end
     
                 Review.create(
                     title: review.css(".reviewTitle").text, 
                     content: review.css(".reviewText").text, 
                     author: review.css('p.consumerName > text()').text, 
                     rating: review.css('div.numRec > text()').text, 
                     date: review.css(".consumerReviewDate").text, 
                     closed: closed, 
                     loantype: loantype, 
                     reviewtype: reviewtype,
                     url: @url
                 )
             end
            page += 1
        end

        rescue => error
            @errors = error
        else 
            Review.all.where(url: @url)
        end
    end

end
