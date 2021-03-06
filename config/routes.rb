Rails.application.routes.draw do
  mount MailsViewer::Engine => '/delivered_mails'
  #get 'admin' => 'admin#index', as: 'admin'
  get 'admin/listings' => 'admin#listings', as: 'admin_listings'
  get 'admin/configurations' => 'admin#configurations', as: 'admin_configurations'
  get 'admin/user' => 'admin#user_management', as: 'admin_user_management'
  get 'admin/edit_listing/:id' => 'admin#edit_listing', as: 'admin_edit_listing'
  get 'admin/new_listing' => 'admin#new_listing', as: 'admin_new_listing'
  delete 'admin/delete_listing/:id' => 'admin#destroy_listing', as: 'admin_delete_listing'
  patch 'admin/update_listing/:id' => 'admin#update_listing', as: 'admin_update_listing'
  post 'admin/create_listing' => 'admin#create_listing', as: 'admin_create_listing'
  patch 'admin/update_configurations' => 'admin#update_configurations', as: 'admin_update_configurations'
  post 'admin/add_admin' => 'admin#add_admin', as: 'admin_add_admin'
  post 'admin/remove_admin/:id' => 'admin#remove_admin', as: 'admin_remove_admin'

  get 'admin/blog' => 'admin#blog_index'
  get 'admin/blog/new' => 'admin#blog_new'
  get 'admin/blog/:id' => 'admin#blog_show', as: "admin_view_blog"
  post 'admin/blog' => 'admin#blog_create', as: "admin_create_blog"
  patch 'admin/blog/:id' => 'admin#blog_update', as: "admin_update_blog"
  delete 'admin/blog/:id' => 'admin#blog_destroy', as: "admin_delete_blog"

  get 'admin/menu' => 'admin#menu_index'
  get 'admin/menu/new' => 'admin#menu_new'
  get 'admin/menu/:id' => 'admin#menu_show', as: "admin_view_menu"
  post 'admin/menu' => 'admin#menu_create', as: "admin_create_menu"
  patch 'admin/menu/:id' => 'admin#menu_update', as: "admin_update_menu"
  delete 'admin/menu/:id' => 'admin#menu_destroy', as: "admin_delete_menu"

  root to: 'home#index'
  get 'fetch_res_data', to: 'fetchdata#fetch_res_data'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :listings do
    collection do
      get :get_listing
      get :map_data
      post :create_lead
      get :walkscore
    end
    member do
      post :leave_page
      post :request_info
      post :email_friend
    end
  end

  resources :favourites
  resources :prospect_matches
  resources :users, only: :update do
    collection do
      post :change_password
      post :user_from_crm
    end
  end

  get 'my_profile' => 'users#my_profile', as: 'my_account'
  get 'subscriptions' => 'users#subscriptions', as: 'subscriptions'
  patch 'update_subscriptions' => 'users#update_subscriptions', as: 'update_subscriptions'
  get 'landing/:slug' => 'landings#show'
  post 'landing/:id/home_value' => 'landings#home_value', as: 'home_value'
  post 'landing/:id/street_watch' => 'landings#street_watch', as: 'street_watch'
  get '/terms' => 'home#terms', as: 'terms'
  get '/privacy' => 'home#privacy', as: 'privacy'
  get '/cookies_policy' => 'home#cookies_policy', as: 'cookies_policy'
  get '/about' => 'home#about', as: 'about'
  get '/sell_with_us' => 'home#sell_with_us', as: 'sell_with_us'
  get '/gallery' => 'home#gallery', as: 'gallery'
  get '/reviews' => 'home#reviews', as: 'reviews'
  get '/location' => 'home#location', as: 'location'
  match '/contact',     to: 'contacts#new',             via: 'get'
  get '/evaluation',     to: 'contacts#new_condo_eval', as: 'condo_eval_form'
  post '/evaluation', to: 'contacts#create_condo_eval', as: 'condo_eval_forms'
  resources "contacts", only: [:new, :create] do
  end
  get '/blog' => 'blogposts#index'
  get '/blog/:id' => 'blogposts#show', as: "show_post"

  comfy_route :cms_admin, :path => '/admin'
  comfy_route :cms, :path => '/content', :sitemap => false

  get '/condos-for-sale' => 'listings#index'
  get '/condos-for-rent' => 'listings#index', defaults: {rent: "1"}
  get '/condos-for-sale/:id' => 'listings#show'
  get '/condos-for-rent/:id' => 'listings#show'
end