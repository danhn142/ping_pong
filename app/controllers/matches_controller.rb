class MatchesController < ApplicationController
  def show
  end

  def create
    if value = "Challenge"
      @match = Match.new
    else
    end
  end

  private
    def challenge_params
      params.require(:matches)
    end
end
