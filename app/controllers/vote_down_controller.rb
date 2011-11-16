class VoteDownController < ApplicationController
  
  def create
    @iniciativa = Initiative.find(params[:iniciativa_id])
    @iniciativa.votes.vote_down
    cookies["voted_#{@iniciativa.id}"] = true
    redirect_to :back
  end
end
