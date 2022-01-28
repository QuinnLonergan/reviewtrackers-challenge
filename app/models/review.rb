class Review < ApplicationRecord
    validates :url, presence: true
    validates :content, uniqueness: true
end
