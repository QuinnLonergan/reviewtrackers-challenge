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
      render json: {error: "invalid!"}, status: 422
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

  
    private
  
    def find_review
      Review.find(params[:id])
    end
  
    def review_params
      params.permit(:title, :content, :author, :rating, :date, :closed, :loantype, :reviewtype)
    end
  
    def render_not_found_response
      render json: { error: "Review not found" }, status: :not_found
    end
end
