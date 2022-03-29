# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      root to: 'municipes#index'
      resources :municipes, only: %i[index update create]
    end
  end
end
