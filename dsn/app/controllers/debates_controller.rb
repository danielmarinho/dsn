class DebatesController < ApplicationController
  
  def index
    @debates = Debate.all
  end
  
  def show
    @debate = Debate.find(params[:id])
    @post = Post.new
  end
  
  def new
    @debate = Debate.new
  end
  
  def create
     @debate = Debate.new(debate_params)
     @debate.user_id = current_user.id
    respond_to do |format|
      if @debate.save
        format.html { redirect_to new_debate_path, notice: 'Debate is now created!' }
        format.json { render :show, status: :created, location: @debate }
      else
        format.html { render :new }
        format.json { render json: @debate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def debate_params
    params.require(:debate).permit(:title, :overview,:status,:user_id)
  end
end