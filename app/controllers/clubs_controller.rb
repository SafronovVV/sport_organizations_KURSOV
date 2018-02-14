class ClubsController < ApplicationController

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to clubs_path
    else
      render 'new'
    end
  end

  def index
    @q = Club.ransack(params[:q])
    @clubs = @q.result
  end

  private

  def club_params
    params.require(:club).permit(:name, :club_type, :sport_id, :sport_organization_id)
  end
end
