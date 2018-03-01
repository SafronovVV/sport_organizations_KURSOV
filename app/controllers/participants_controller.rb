class ParticipantsController < ApplicationController
  before_action :find_participant, only: %i[edit update]
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
    @q = Participant.ransack(params[:q])
    @participants = @q.result
  end

  def edit;end

  def update
    if @participant.update(participant_params)
      redirect_to participants_path
    else
      render 'edit'
    end
  end

  def download_list
    @participants = Participant.find(params[:participant_ids])
    respond_to do |format|
      format.docx { render docx: 'participants_list', filename: 'participants_list.docx' }
    end
  end

  private

  def find_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:name, :age, :growth, :weight, :club_id)
  end
end
