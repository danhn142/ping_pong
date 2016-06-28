class DashboardsController < ApplicationController
  def main
    @players = User.all.order('rank')
    @comments = Comment.all.order('created_at')
  end
end
