class Review < ApplicationRecord
    validates :url, presence: true
    validates :title, presence: true
    validates :content, presence: true
    validates :author, presence: true
    validates :rating, presence: true
    validates :date, presence: true
    validates :loantype, presence: true
    validates :reviewtype, presence: true
    
    validates :content, uniqueness: true
end
