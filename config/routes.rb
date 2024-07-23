Rails.application.routes.draw do
  # mount Ckeditor::Engine => '/ckeditor'
  root to: 'home#index'
  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }


  resources :roles
  resources :rooms
  resources :e_joins
  resources :e_registrations do
    member do
      post 'create_event_from_registration'
      get 'reject'
    end
  end
  resources :reviews
  resources :events
  resources :subjects
  resources :users, only: [:update]

  get 'home/index'
  get 'home/about'
  get 'e_registrations/new', to: 'e_registrations#create', as: 'create'
  get 'home/tutorial'
  get 'events/new'
  get 'e_registrations/new', to: 'e_registrations#new', as: 'e_registrations_new'
  get '/e_joins/new', to: 'e_joins#new', as: 'e_joins_new'
  get 'user/role_id', to: 'users#index'
  get 'home/manager' #trang quan ly danh cho admin
  get 'users/list', to: 'users#index' #user quan ly nguoi dung
  post '/e_joins', to: 'e_joins#create'
  get 'users/list', to: 'users#index', as: 'list_users'
  # put 'users/:id/ban', to: 'users#ban', as: 'ban_user'
  get 'users/:id/ban', to: 'users#ban', as: 'ban_user'
  # put 'users/:id/unban', to: 'users#unban', as: 'unban_user'
  get 'users/:id/unban', to: 'users#unban', as: 'unban_user'
  put 'users/:id/toadmin', to: 'users#toadmin', as: 'toadmin_user'
  put 'users/:id/toguest', to: 'users#toguest', as: 'toguest_user'
  put 'e_registrations/:id/reject', to: 'e_registrations#reject', as: 'reject'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
