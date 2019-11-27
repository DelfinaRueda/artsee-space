class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @artwork = Artwork.find(params[:artwork_id])
    @comment.artwork = @artwork
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to artwork_path(@artwork) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'artworks/show' }
        format.js
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

