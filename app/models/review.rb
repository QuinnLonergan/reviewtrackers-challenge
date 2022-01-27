class MyValidator < ActiveModel::Validator
    def validate(record)
      unless record.url.include? 'www.lendingtree.com/reviews'
        record.errors.add :name, "Must be a URL from lendingtree.com!"
      end
    end
  end

class Review < ApplicationRecord
    include ActiveModel::Validations
    validates_with MyValidator
    validates :url, presence: true
end
