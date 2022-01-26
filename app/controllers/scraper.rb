class Scraper
    def get_page
        Nokogiri::HTML(open("https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183"))
    end
end
