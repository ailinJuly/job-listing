Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
        resources :jobs do
          collection do
            post :bulk_update
          end

          member do
            post :reorder
          end
        end

      end

      resources :jobs
      root 'jobs#index'
end
