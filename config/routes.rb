Rails.application.routes.draw do
  devise_for :users, path: "",
                     path_names: { sign_in: 'sign_in',
                                   sign_up: 'sign_up',
                                   sign_out: 'sign_out',
                                   password: 'password',
                                   confirmation: 'confirmation',
                                   unlock: 'unlock'
                                 },
                     controllers: { registrations: "users/registrations",
                                     sessions:     "users/sessions",
                                     # passwords:     "passwords",
                                     # confirmations: "confirmations",
                                   }

  devise_scope :user do
    get  '/'        => 'main#index'

    get  '/account'        => 'account#index'
    post '/account/update' => 'account#update_account'

    namespace :dictionary do
      resources :dictionaries, only: [:new, :create, :edit, :update, :destroy]
      get "dictionaries/:id/new_word"      => "dictionaries#new_word"
      get "dictionaries/:id/new_translate" => "dictionaries#new_translate"
    end

    namespace :api do
      namespace :users do
        resources :sessions,      only: [:create]
        resources :registrations, only: [:create]
      end
    end
  end

end
