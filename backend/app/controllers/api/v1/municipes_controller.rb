class Api::V1::MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[edit update]

  def index
    @municipes = Municipe.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded posts', data:@municipes}, status: :ok
  end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      render json: {status: 'SUCCESS', message: 'Post is saved', data:@municipe}, status: :ok
    else
      render json: {status: 'Error', message: 'Post is not saved', data:@municipe.errors}, status: :unprocessable_entity
    end
  end

  def update
    @municipe = Municipe.find(params[:id])

    if @municipe.update(municipe_params)
      render json: {status: 'SUCCESS', message: 'Post is updated', data:@municipe}, status: :ok
    else
      render json: {status: 'Error', message: 'Post is not updated', data:@municipe.errors}, status: :unprocessable_entity
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birth_date, :telephone, :status, :photo,
                                     endereco_attributes: [:id, :CEP, :public_place, :complement, :district, :city, :UF, :IBGE_code])
  end
end
