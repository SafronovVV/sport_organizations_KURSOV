class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to participants_path
    else
      render 'new'
    end
  end

  def index
    @participants = get_collection
  end

  private

  def get_collection
    if params[:club_id]
      return Participant.where(club_id: params[:club_id])
    elsif params[:competition_id]
      return Competition.find(params[:competition_id]).requests.
             map {|c| c.participant}
    else
      return Participant.all
    end
  end

  def participant_params
    params.require(:participant).permit(:name, :age, :growth, :weight, :club_id)
  end
end
