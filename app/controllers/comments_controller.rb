class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = current_user
    if @comment.save
      #ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
      redirect_to @product
      #notice: 'Review was created successfully.'
    else
      redirect_to @product
      #alert: 'Review could not be saved.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end
