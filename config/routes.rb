Pxwh::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root :to => "main#index"
  # 关于我们
  resources :ours do
    collection do
      post 'user_create'
      get 'joinus'
      get 'elite_team'
      get 'journalism'
      get 'daozha'
      get 'news_trends'
      get 'dynamic_announcement'
    end
    member do
      get 'journalism_show'
    end
  end
  # 互动服务
  resources :services
  # 经典案例
  resources :cases do
    collection do
      get 'dangche'
      get 'longjia'
      get 'weixin'
    end
  end
  # 合作伙伴
  resources :clients
  # 联系我们
  resources :contacts
  #admin
  namespace :admin do
    match '' => 'home#index', :via => :get
    match '/login' => 'main#login', :via => :get
    match '/logout' => 'main#logout', :via => :get
    resources :main do
      collection do
        post 'check_login'
      end
    end
    # 招聘管理
    resources :job
    # 求职简历
    resources :accounts do
      collection do
        post 'update_multiple'
      end
    end
    # 首页
    resources :home
    # 经典案例
    resources :classic_cases
    # 企业伙伴
    resources :customers
    # 最新动态
    resources :journalisms
  end

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
