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
        ConfirmationSender.send_message_to(@match.opponent)
        redirect_to :back
      else
        redirect_to :back
      end
    end
  end

  def update
    @match = Match.find(params[:id])
    @accept = Match.where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "Accept").last
    if params[:click] == "Accept"
      # where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "pending").first
      @match.update_attribute(:status, "Accept")
      redirect_to '/game/show'
    elsif params[:click] == "Deny"
      @match.update_attribute(:status, "Deny")
      redirect_to '/dashboards/main#bottom'
    elsif params[:click] == "Challenger Wins"
      @accept.update_attribute(:in_session, @accept.user)
      @accept.user.increment!(:win)
      @accept.opponent.increment!(:loss)
      @accept.user.decrement!(:rank)
      @accept.opponent.increment!(:rank)
      redirect_to '/dashboards/main#bottom'
    else
      @accept.update_attribute(:in_session, @accept.opponent)
      @accept.opponent.increment!(:win)
      @accept.user.increment!(:loss)
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
