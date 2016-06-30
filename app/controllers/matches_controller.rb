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
    @accept = Match.where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "Accept").last
    if value = "Accept"
      # where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "pending").first
      @match.update_attribute(:status, "Accept")
      redirect_to '/game/show'
    end
    if value = "Deny"
      @match.update_attribute(:status, "Deny")
      redirect_to '/dashboards/main#bottom'
    end
    if value = "Challenger Wins"
      @match.update_attribute(:in_session, @accept.user.id)
      redirect_to :back
    else
      @match.update_attribute(:in_session, @accept.opponent.id)
      redirect_to :back
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
