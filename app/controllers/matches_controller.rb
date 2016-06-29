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

    def destroy
      @match = current_user.matches.where(status:"pending").first.id
      @match.destroy
      redirect_to 'dashboards/main#bottom'
    end
  end


end
