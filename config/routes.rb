Rt::Application.routes.draw do


  resources :sessions
  resources :candidates

  match 'test/:id' =>'candidates#new'

  match 'administration' => 'administration#index'

  match '/test_center/instructions' => 'test_center#instructions',:as=>"instructions"
  match '/test_center/test' => 'test_center#test',:as=>"test"
  match '/test_center/wait' => 'test_center#wait',:as=>"wait"
  match '/test_center/finish' => 'test_center#finish'
  match "/test_center/evaluate" => 'test_center#evaluate'
  scope "/administration" do
    resources :online_tests
    resources :questions
    resources :results
    match "/results/print/:id"=>"results#print" ,:as=>"print_results"
    match "/questions/test_questions/:id"=> "questions#online_test_questions",:as=>"test_questions"
    match "/online_tests/close/:id"=>"online_tests#close",:as=>"close_test"
    match 'login' => 'sessions#new'
    match 'logout' => 'sessions#destroy'
    match 'administration/edit' => 'users#edit',:as=>"admin_edit"
  end




  resources :users
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id))(.:format)'
end
