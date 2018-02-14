class CompetitionsController < ApplicationController
  respond_to :docx

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      redirect_to competitions_path
    else
      render 'new'
    end
  end

  def index
    @q = Competition.ransack(params[:q])
    @competitions = @q.result
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :organizator, :date, :sport_id, :sport_complex_id)
  end
end
