class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:edit]
  before_action :find_review, only: [:edit]

  def show
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
  end

  def new
    find_restaurant
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
