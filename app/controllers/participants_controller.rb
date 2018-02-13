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
    @participants = Participant.all
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :age, :growth, :weight, :club_id)
  end
end
