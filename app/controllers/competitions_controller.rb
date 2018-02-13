class CompetitionsController < ApplicationController

  def new
    @month_names = %i[ Январь Февраль Март Апрель Май Июнь Июль Август Сентябрь
                      Октябрь Ноябрь Декабрь ]
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
    @competitions = Competition.all
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :organizator, :date, :sport_id, :sport_complex_id)
  end
end
