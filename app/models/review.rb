class Review < ApplicationRecord
    validates :url, presence: true
end
