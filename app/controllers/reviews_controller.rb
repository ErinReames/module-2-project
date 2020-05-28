class ReviewsController < ApplicationController
    def index
        @reviews = Review.all_rating_ordered
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
        !!params[:review] ? @review = Review.new(review_params) : @review = Review.new
    end

    def create
        @review = Review.create(review_params)
        if @review.valid?
            redirect_to review_path(@review)
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to(new_review_path(review: review_params))
        end
    end

   
     
    private

    def review_params
        params.require(:review).permit(:pet_id, :user_id, :title, :content, :rating)
    end
end
