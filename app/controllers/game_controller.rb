class GameController < ApplicationController
  def show
    @challenge = Match.where(user: current_user, opponent: User.where(rank: current_user.rank-1), status: "pending")
    @pending = Match.where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "pending").first
    @accept = Match.where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "Accept").first
    @challenger = User.where(rank: current_user.rank+1).first
  end
end
