Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/server_error'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'registrations' }

  scope(path_names: { new: 'novo', edit: 'editar', show: 'ver' }) do
    # Errors
    get '/404' => 'errors#not_found'
    get '/422' => 'errors#server_error'
    get '/500' => 'errors#server_error'

    get '/dashboard' => 'dashboards#index'

    resources :newsletters
    resources :movements, path: 'fluxo-de-caixa'
    resources :movement_categories, path: '/fluxo-de-caixa/categorias'
    resources :installments, path: 'parcelas'
    resources :contracts, path: 'contratos'
    resources :accounts, path: 'contas'
    resources :events, path: 'eventos'
    resources :users, path: 'usuarios'

    resources :passengers, path: 'passageiros' do
      resources :contracts, path: 'contrato' do
        resources :installments, path: 'parcelas' do
          post '/update_installment/:id/:paid' => 'installments#update'
        end
      end
    end

    scope '/admin' do
      resources :suggestions, path: 'sugestoes'
      resources :spectator, path: 'espectadores'
      resources :banks, path: 'bancos'
      resources :plans, path: 'planos'
      resources :newsletters
    end

    scope '/perfil' do
      get '/' => 'users#show', :as => :eu
      resources :my_configurations, path: 'configuracoes'
    end
  end

  scope '/billet' do
    get '/generate_billet/:format/:id' => 'billet#generate_billet'
    get '/multiple_billet/:format/:id' => 'billet#multiple_billet'
  end

  devise_scope :user do
    get '/entrar' => 'devise/sessions#new', as: :entrar
    get '/editar' => 'devise/registrations#edit'
    get '/sair' => 'devise/sessions#destroy'
  end

  get '/planos' => 'home#plan', as: :pricing
  get '/contato' => 'home#contact'
  post '/contato' => 'home#send_contact'

  # Message path
  get "/messages" => redirect("/conversations")
  resources :messages do
    # post '/create/:id' => 'messages#create'
    member do
      post :new
    end
  end
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
    collection do
      get :trashbin
      post :empty_trash
    end
  end

  root 'home#index'
end
