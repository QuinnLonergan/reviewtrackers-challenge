require "rails_helper"

RSpec.describe "review API", :type => :request do

  # describe "get_reviews" do
  #   it "returns a list of reviews from a valid lendingtree url" do
  #     post "/get_reviews", params: {url: "https://www.lendingtree.com/reviews/mortgage/loansnap/39777117"}
  #     json_response = JSON.parse(response.body)
  #     expect(response.status).to eq 201
  #   end
  # end

  # describe "get_reviews" do
  #   it "returns an error for an invalid url" do
  #     post "/get_reviews", params: {url: "www.google.com"}
  #     json_response = JSON.parse(response.body)
  #     expect(json_response).to eq "error" => "Invalid URL"
  #     expect(response.status).to eq 422
  #   end
  # end
  
  describe "get_reviews" do
    it "returns an error for an invalid lendingtree url" do
      post "/get_reviews", params: {url: "https://www.lendingtree.com/reviews/"}
      json_response = JSON.parse(response.body)
      expect(json_response).to eq "error" => "Must be lender URL"
      expect(response.status).to eq 422
    end
  end
end