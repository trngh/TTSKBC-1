Rails.application.routes.draw do
  resources :roles
  resources :rooms
  resources :e_joins
  resources :e_registrations do
    member do
      post 'create_event_from_registration'
      put 'reject'
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
  put 'users/:id/ban', to: 'users#ban', as: 'ban_user'
  put 'users/:id/unban', to: 'users#unban', as: 'unban_user'
  put 'users/:id/toadmin', to: 'users#toadmin', as: 'toadmin_user'
  put 'users/:id/toguest', to: 'users#toguest', as: 'toguest_user'
  put 'e_registrations/:id/reject', to: 'e_registrations#reject', as: 'reject_e_registraion'

  devise_for :users

  root to: 'home#index'

  # get 'home/select_by_subject/:id', to: 'home#select_by_subject', as: 'select_by_subject'
end
