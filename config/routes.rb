Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :cars do
        resources :comments, only: [:index, :create, :destroy]
      end
    end
  end
  root 'static_pages#home'
  # constraints :subdomain => 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :cars do
  #         resources :comments, only: [:index, :create, :destroy]
  #       end
  #     end
  #   end
  # end
  # get '*unmatched_route', :to => 'application#raise_not_found!'
  # match '(errors)/:status', to: 'errors#show', constraints: { status: /\d{3}/ }, via: [:get, :post]
  # get http://api.myapp.com/v1/cars
  # constraints :subdomain => 'api' do
  #   namespace :api, path: nil, defaults: { format: 'json' } do
  #     scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
  #       resources :cars
  #     end
  #   end
  # end

  # get http://api.myapp.com/v1/events/
  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :events
  #     end
  #   end
  # end

  # controller should be ..
#   app/controllers/
# .
# |-- api
# |   `-- v1
# |       |-- api_controller.rb
# |       `-- events_controller.rb
# |-- application_controller.rb

# app/controllers/api/v1/api_controller.rb
# module Api::V1
#   class ApiController < ApplicationController
#     # Generic API stuff here
#   end
# end

# app/controllers/api/v1/events_controller.rb
# module Api::V1
#   class EventsController < ApiController
#     # POST /v1/events
#     def create
#       render json: params.to_json
#     end
#   end
# end





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
