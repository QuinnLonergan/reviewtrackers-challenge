class Scraper

    def get_page
        Nokogiri::HTML(open("https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183"))
    end

    def get_reviews
        self.get_page.css
    end

end
