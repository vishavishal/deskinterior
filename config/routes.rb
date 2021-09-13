Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  #------------- Get requests ----------------------
  get 'project/new'
  get 'projects'              => 'project#index'
  get 'space'                 => 'space#index'
  get 'settings'              => 'settings#display'


  #------------- POST requests ---------------------
  post 'project/create'
  post 'settings/update_json' => 'settings#update_json'
  post 'space/index'          => 'space#index'
end
