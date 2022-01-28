require "rails_helper"

RSpec.describe "review API", :type => :request do

  describe "get_reviews" do
    it "returns a list of reviews from a valid lendingtree url" do
      post "/get_reviews", params: {url: "https://www.lendingtree.com/reviews/mortgage/loansnap/39777117"}
      json_response = JSON.parse(response.body)
      expect(response.status).to eq 201
    end
  end

  # it "returns an error for an invalid url" do
  #   get "/widgets/new"
  #   expect(response).to_not render_template(:show)
  # end

  # it "returns an error for an invalid lendingtree url" do
  #   get "/widgets/new"
  #   expect(response).to_not render_template(:show)
  # end
end
