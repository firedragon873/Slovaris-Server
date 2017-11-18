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
    # Here write our routes
  end

end
