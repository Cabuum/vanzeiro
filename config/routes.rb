Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'
  }

  localized do
    devise_scope :user do
      get :sign_in, to: 'devise/sessions#new', as: :new_user_session
      get :sign_out, to: 'devise/sessions#destroy', as: :destroy_user_session
    end

    # get 'errors/not_found'
    # get 'errors/server_error'

    # Errors
    get '/404' => 'errors#not_found'
    get '/422' => 'errors#server_error'
    get '/500' => 'errors#server_error'

    get '/dashboard' => 'dashboards#index'

    resources :newsletters
    resources :movements
    resources :movement_categories
    resources :installments
    resources :contracts
    resources :bank_accounts
    resources :events
    resources :users

    resources :passengers do
      resources :contracts do
        resources :installments do
          post '/update_installment/:id/:paid' => 'installments#update'
        end
      end
    end

    scope :admin do
      root controller: :plans, action: :index

      resources :suggestions
      resources :spectator
      resources :banks
      resources :plans
      resources :newsletters
    end

    scope :profile do
      root controller: :users, action: :show

      resources :settings
    end

    resources :billet do
      get '/generate_billet/:format/:id' => 'billet#generate_billet'
      get '/multiple_billet/:format/:id' => 'billet#multiple_billet'
    end

    # REFACTOR IT:
    scope nil do
      get 'planos' => 'home#plan', as: :pricing
      get 'contato' => 'home#contact', as: :contact
      post 'contato' => 'home#send_contact'
    end

    root controller: :home, action: :index
  end
end
