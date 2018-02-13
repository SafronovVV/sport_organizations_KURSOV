class SportComplexesController < ApplicationController

  def new
    @sport_complex = SportComplex.new
  end

  def create
    @sport_complex = SportComplex.new(sport_complex_params)
    if @sport_complex.save
      redirect_to sport_complexes_path
    else
      render 'new'
    end
  end

  def index
    @sport_complexes = SportComplex.all
  end

  private

  def sport_complex_params
    params.require(:sport_complex).permit(:name, :address, :capacity)
  end
end
