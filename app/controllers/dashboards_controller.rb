class DashboardsController < ApplicationController
  def main
    @players = User.all.order('rank')
    @comments = Comment.all.order('created_at')
    @challenge = Match.where(user: current_user, opponent: User.where(rank: current_user.rank-1), status: "pending")
    @pending = Match.where(user: User.where(rank: current_user.rank+1), opponent: current_user, status: "pending").first
    @challenger = User.where(rank: current_user.rank+1).first
  end
end
