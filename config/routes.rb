Rails.application.routes.draw do
  get 'notifications/viewNotifications'

  resources :notifications
  resources :line_items
  resources :rainchecks
  
  get 'fuser/show'
  get 'msessions/new'
  get 'musers/new'
  get 'restaurants/find'
  get 'restaurants/view'
  get 'places/find'
  get 'places/view'
  get 'friends/view'
  get 'friends/list'
  get 'friends/invite'
  get 'home/view'
  root 'home#view'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'invitations/view'

  get 'login' => 'msessions#new'
  post 'login' => 'msessions#create'
  match 'logout', to: 'msessions#destroy', as: 'logout', via: [:get, :post]
  match 'get_notifications', to: 'notifications#viewNotifications', via: [:get]
  match 'accept', to: 'invitations#accept', via: [:get]
  match 'reject', to: 'invitations#reject', via: [:get]
  match 'invites', to: 'invitations#view', via: [:get]
  match 'invite', to: "friends#invite", via: [:get]
  match 'invitation', to: "friends#youinvite", via: [:get]
  match 'fl', to: 'friends#list', via: [:get]
  match 'new_raincheck', to: 'rainchecks#new', via: [:get]
  match 'create', to: 'musers#new', via: [:get]
  match 'restaurants', to: 'restaurants#find', via: [:get]
  match 'add', to: 'restaurants#view', via: [:get]
  match 'locations', to: 'places#find', via: [:get]
  match 'friends', to: 'friends#view', via: [:get]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  match 'fuser', to: 'fuser#show', via: [:get]
  match 'muser', to: 'musers#show', via: [:get]
  
  resources :invitations
  resources :restaurants
  resources :musers
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
