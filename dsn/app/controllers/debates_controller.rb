class DebatesController < ApplicationController
  
  def index
    @debates = Debate.all
  end
  
  def show
    @debate = Debate.find(params[:id])
    if @debate.visits.nil?
      @debate.visits = 0
    end
    @debate.visits = @debate.visits+1
    @debate.save
    @post = Post.new
  end
  
  def new
    @debate = Debate.new
  end
  
  def create
     @debate = Debate.new(debate_params)
     @debate.user_id = current_user.id
     @debate.visits = 0
    respond_to do |format|
      if @debate.save
        format.html { redirect_to debate_path(@debate.id), notice: 'Debate is now created!' }
        format.json { render :show, status: :created, location: @debate }
      else
        format.html { render :new }
        format.json { render json: @debate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @debate = Debate.find(params[:id])
  end
  
  def update
    @debate = Debate.find(params[:id])
    respond_to do |format|
      if @debate.update(debate_params)
        format.html { redirect_to debate_path(@debate.id), notice: 'Debate updated!' }
        format.json { render :show, status: :created, location: @debate }
      else
        format.html { render :new }
        format.json { render json: @debate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @debate = Debate.find(params[:id])
    respond_to do |format|
      if @debate.destroy
        format.html { redirect_to debates_path, notice: 'Debate deleted' }
      else
        format.html { redirect_to debate_path(@debate.id), alert: "Couldn't delete debate." }
      end
    end
  end
  
  def debate_params
    params.require(:debate).permit(:title, :overview,:status,:user_id,:picture)
  end
end