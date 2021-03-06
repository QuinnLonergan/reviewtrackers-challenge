require "rails_helper"

RSpec.describe "review API", :type => :request do

  describe "collect_reviews" do
    it "returns a list of reviews with correct parameters from a valid lendingtree url" do
      post "/collect_reviews", params: {url: "https://www.lendingtree.com/reviews/mortgage/loansnap/39777117"}
      json_response = JSON.parse(response.body)
      instance = json_response[0]
      expect(instance["title"]).to be_a(String)
      expect(instance["content"]).to be_a(String)
      expect(instance["author"]).to be_a(String)
      expect(instance["rating"]).to be_a(String)
      expect(instance["closed"]).to be_in([true, false])
      expect(instance["loantype"]).to be_a(String)
      expect(instance["reviewtype"]).to be_a(String)
      expect(instance["url"]).to be_a(String)
      expect(response.status).to eq 201
    end
  end

  describe "collect_reviews" do
    it "Does not allow duplicate reviews to be posted" do
      post "/collect_reviews", params: {url: "https://www.lendingtree.com/reviews/mortgage/grander-home-loans-inc/58426567"}
      post "/collect_reviews", params: {url: "https://www.lendingtree.com/reviews/mortgage/grander-home-loans-inc/58426567"}
      json_response = JSON.parse(response.body)
      expect(response.status).to eq 201
      expect(json_response.uniq.count).to eq json_response.count
    end
  end

  describe "collect_reviews" do
    it "Uses pagination to return every review for a given lender" do
      post "/collect_reviews", params: {url: "https://www.lendingtree.com/reviews/mortgage/loansnap/39777117"}
      json_response = JSON.parse(response.body)
      expect(response.status).to eq 201
      expect(json_response.count).to be > 450
    end
  end

  describe "collect_reviews" do
    it "returns an error for an invalid url" do
      post "/collect_reviews", params: {url: "www.google.com"}
      json_response = JSON.parse(response.body)
      expect(json_response).to eq "error" => "Invalid URL"
      expect(response.status).to eq 422
    end
  end
  
  describe "collect_reviews" do
    it "returns an error for an invalid lendingtree url" do
      post "/collect_reviews", params: {url: "https://www.lendingtree.com/reviews/"}
      json_response = JSON.parse(response.body)
      expect(json_response).to eq "error" => "Must be lender URL"
      expect(response.status).to eq 422
    end
  end
end
