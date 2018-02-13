class ParticipantsController < ApplicationController
  respond_to :docx

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

  def download_list
    @participants = Participant.find(params[:participant_ids])
    respond_to do |format|
      format.docx { render docx: 'participants_list', filename: 'participants_list.docx' }
    end
  end

  private

  def get_collection
    params[:club_id] ? Participant.where(club_id: params[:club_id]) : Participant.all
  end

  def participant_params
    params.require(:participant).permit(:name, :age, :growth, :weight, :club_id)
  end
end
