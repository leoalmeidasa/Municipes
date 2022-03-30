# frozen_string_literal: true

module Api
  module V1
    class MunicipesController < ApplicationController
      before_action :set_municipe, only: %i[edit update]

      def index
        @municipes = Municipe.all
        render json: @municipes, status: :ok
      end

      def new
        @municipe = Municipe.new
        @municipe.build_endereco
      end

      def create
        @municipe = Municipe.new(municipe_params)

        if @municipe.save
          render json: @municipe, status: :created
        else
          render json: @municipe.errors, status: :unprocessable_entity
        end
      end

      def update
        @municipe = Municipe.find(params[:id])

        if @municipe.update(municipe_params)
          render json: { status: 'SUCCESS', message: 'Post is updated', data: @municipe }, status: :ok
        else
          render json: { status: 'Error', message: 'Post is not updated', data: @municipe.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def set_municipe
        @municipe = Municipe.find(params[:id])
      end

      def municipe_params
        params.permit(:id, :description, :cpf, :cns, :email, :birth_date, :telephone, :status, :photo,
                                         endereco_attributes: %i[id CEP street complement district city UF IBGE_code])
      end
    end
  end
end
