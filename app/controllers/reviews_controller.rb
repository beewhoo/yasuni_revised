class ReviewsController < ApplicationController


  def create
    @review = Review.new

     @review.name = params[:review][:name]
     @review.message = params[:review][:message]
     @review.rating = params[:review][:rating]
     @review.product_id = params[:product_id]


     if @review.save
        flash[:success] = "review successful added!"
        redirect_to product_path(params[:product_id])
     else
       redirect_to product_path(params[:product_id])
     end
  end


  def edit
    @review = Review.find(params[:id])
  end


  def destroy
     @review = Review.find(params[:id])
     @review.delete
     flash[:notice] = "review successfully deleted!"
     redirect_to product_path(params[:product_id])
  end


end
