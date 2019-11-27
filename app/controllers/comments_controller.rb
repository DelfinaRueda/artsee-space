class CommentsController < ApplicationController

  def create

    @comment = Comment.new(comment_params)
    @artwork = Artwork.find(params[:artwork_id])
    @comment.artwork = @artwork
    @comment.user = current_user
    if @comment.save
      redirect_to artwork_path(@artwork)
    else
      render :show
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
