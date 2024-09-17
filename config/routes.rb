Rails.application.routes.draw do
  root 'homepage#index'

  devise_for :users, defaults: { format: :json },
                        controllers: {
                          registrations: 'users/registrations',
                          sessions: 'users/sessions'
                        }

  resources :credentials, except: :show
end
