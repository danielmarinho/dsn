class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  def index
    @top_3_debates = [Debate.first,Debate.all[1],Debate.all[2]]#It will be replaced for the right method later
  end
  
end
