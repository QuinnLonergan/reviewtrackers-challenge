class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
      reviews = Review.all
      render json: reviews
    end
  
    def show
      review = find_review
      render json: review
    end
  
    def create
      review = Review.create!(review_params)
      render json: review, status: :created
    rescue ActiveRecord::RecordInvalid => invalid 
      render json: {error: "Invalid Parameters"}, status: 422
    end
  
    def update
      review = find_review
      review.update(review_params)
      render json: review
    end
  
    def destroy
      review = find_review
      review.destroy
      head :no_content
    end

    def get_reviews
        reviews = Scraper.new.make_reviews(url_params)
        render json: reviews, status: :created
    end

  
    private
  
    def find_review
      Review.find(params[:id])
    end

    def url_params
        params.permit(:url)
    end
  
    def review_params
      params.permit(:title, :content, :author, :rating, :date, :closed, :loantype, :reviewtype, :url)
    end
  
    def render_not_found_response
      render json: { error: "Review not found" }, status: :not_found
    end
end
