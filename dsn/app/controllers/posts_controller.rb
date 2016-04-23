# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class PostsController < ApplicationController
  def create
     @post = Post.new(post_params)
     @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to debate_path(params[:post][:debate_id]) }
      else
        format.html { render :new }
      end
    end
  end
  
  def post_params
    params.require(:post).permit(:content,:debate_id,:user_id,:bootsy_image_gallery_id)
  end
end
