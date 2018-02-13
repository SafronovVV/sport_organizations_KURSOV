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
    @competitions = get_collection
  end

  private

  def get_collection
    (params[:sport_id] || params[:sport_complex_id]) ? Competition.where('sport_id=? OR sport_complex_id=?',
          params[:sport_id], params[:sport_complex_id]) : Competition.all
  end

  def competition_params
    params.require(:competition).permit(:name, :organizator, :date, :sport_id, :sport_complex_id)
  end
end
