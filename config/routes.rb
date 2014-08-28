Rails.application.routes.draw do
  
  namespace :admin do
    resources :banner_configs
  end

  get 'about' => 'about#index'

  get 'mycompare' => 'mycompare#index'
  get 'mycompare/:id/remove' => 'mycompare#remove'
  get 'mycompare/:id/add' => 'mycompare#add'
  namespace :admin do
    resources :banners
  end

  post 'search' => "search#index"

  get 'best_seller/index'

  #new_product
  get 'new_product' =>"new_product#index"
  get 'new_product/:id' =>"new_product#by_cat"
  
  #special product
  get 'special_product' =>"special_product#index"
  get 'special_product/:id' =>"special_product#by_cat"

  namespace :admin do
    get 'vouchers/send_email' =>"vouchers#send_email"
    resources :vouchers
  end

  namespace :admin do
    resources :backup_restores
  end


  namespace :admin do
    resources :coupons
  end

  namespace :admin do
    #get 'mymailers/edit'
    resources :mymailers
  end
  
  get 'customers' => 'customers#index'
  get 'customers/:id/update' => 'customers#update'
  get 'customers/new' => 'customers#new'
  get 'customers/login' => 'customers#login'
  get 'customers/logout' => 'customers#logout'
  get 'customers/my_order' => 'customers#my_order'
  get 'customers/my_info' => 'customers#my_info'
  get 'customers/check_login' => 'customers#check_login'
  #resources :customers
  

  namespace :admin do
  get 'myreports'=>'myreports#index'
  get 'myreports/list_customers'=>'myreports#list_customers'
  get 'myreports/cus_view_buy'=>'myreports#cus_view_buy'
  get 'myreports/cus_export'=>'myreports#cus_export',via: :get, as: :cus_export, defaults: { format: 'xlsx' }
  end

  namespace :admin do
    resources :attributes
  end

  namespace :admin do
    resources :systemconfigs
  end

  namespace :admin do
    resources :stores
  end

  resources :manufacturers

  namespace :admin do
    get 'orders/report' => "orders#report",via: :get, as: :report
    get 'orders/o_export' => "orders#o_export",via: :get, as: :o_export, defaults: { format: 'xlsx' }
    resources :orders
    
  end

  # config for Devise, skip front_end page (sanpham)
  
  devise_for :users, class_name: "Admin::User",:skip => :registrations
  get 'users/sign_up' => "sanpham#index"
  
  
  # Default 
  root :to => 'sanpham#index'
  
  get 'sanpham'=>"sanpham#index"
  get 'sanpham/detail/:id' => 'sanpham#detail'
  get 'sanpham/:id' => 'sanpham#products_by_cat'
  get 'sanpham/:id/add_to_cart' => 'sanpham#add_to_cart'
  get 'sanpham/:id_qty/btn_add_to_cart' => 'sanpham#btn_add_to_cart'
  get 'sanpham/:id/special_product' => 'sanpham#special_product'
  
  #orders
  resources :orders
  get 'orders/:id/check_coupon' => 'orders#check_coupon'
  get 'orders/:id/:qty' => 'orders#update_to_cart'
  get 'orders/:id/del' => 'orders#del_product_cart'
  
  
 
  # config for ActiveAdmin
  ActiveAdmin.routes(self)
  namespace :admin do
    #get 'homes/index'
    resources :users
    resources :catalogues
    get 'products/p_report' => "products#p_report",via: :get, as: :p_report
    get 'products/p_export' => "products#p_export",via: :get, as: :p_export, defaults: { format: 'xlsx' }
    get 'products/:id/add_attr' => "products#add_attr",via: :get, as: :add_attr
    resources :products
    
  end
end
