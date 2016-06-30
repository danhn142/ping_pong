class MatchesController < ApplicationController
  def show
  end

  def create
    if value = "Challenge!"
      @match = Match.new
      @match.user_id = current_user.id
      @match.opponent_id = params[:match][:opponent_id]
      @match.status = params[:match][:status]
      @match.match_type = params[:match][:match_type]
      if @match.save
        redirect_to :back
      else
        redirect_to :back
      end
    end
  end

  def update
    @match = Match.find(params[:id])
    if value = "Accept"
      # where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "pending").first
      @match.update_attribute(:status, "Accept")
      redirect_to '/game/show'
    else
      @match.update_attribute(:status, "Deny")
      redirect_to '/dashboards/main#bottom'
    end
  end

  def destroy
    @rank_up
    @match = Match.find(params[:id])
    # where(user: current_user, opponent: User.where(rank: current_user.rank-1)).last
    @match.destroy
    redirect_to '/dashboards/main#bottom'
  end



end
