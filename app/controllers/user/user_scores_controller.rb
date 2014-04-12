class User::UserScoresController < User::BaseUserController
  before_filter :load_contest, only: [:index]

  def index
    @total_scores = UserScore.total_scores
    @user_scores = UserScore.in_contest(@contest).page(params[:page]).per(Settings.pagination.user_scores.index)
  end

  private
  def load_contest
    @contest = Contest.find_by_id params[:contest_id]
  end
end
