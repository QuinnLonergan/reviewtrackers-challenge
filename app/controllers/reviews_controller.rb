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

    def show_genre
      cardstacks = Cardstack.where(user_id: 3)
      render json: cardstacks
    end
  
  
    private
  
    def find_cardstack
      Cardstack.find(params[:id])
    end
  
    def cardstack_params
      params.permit(:name, :user_id)
    end
  
    def render_not_found_response
      render json: { error: "Cardstack not found" }, status: :not_found
    end
end
