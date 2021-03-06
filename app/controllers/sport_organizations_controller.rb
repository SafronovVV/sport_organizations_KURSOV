class SportOrganizationsController < ApplicationController

  def new
    @sport_organization = SportOrganization.new
  end

  def create
    @sport_organization = SportOrganization.new(sport_organization_params)
    if @sport_organization.save
      redirect_to sport_organizations_path
    else
      render 'new'
    end
  end

  def index
    @q = SportOrganization.ransack(params[:q])
    @sport_organizations = @q.result
  end

  private

  def sport_organization_params
    params.require(:sport_organization).permit(:name, :director_name)
  end
end
