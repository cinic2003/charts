Thought::Application.routes.draw do

  resources :charts do
    collection do 
      get 'index'
      get 'pie_chart'
      get 'graph_chart'
      get 'line_chart'
      get 'line_dot'
    end
  end

  resources :chart_data do
    collection do
      get 'get_bar'#, :on => :collection
      get 'get_graph'#, :on => :collection
      get 'get_pie'#, :on => :collection
      get 'get_line'#, :on => :collection
      get 'get_hollow'
      get 'get_dot'
      get 'get_linedot'
    end
  end

  resources :home do
    collection do
      get 'share_list'
      get 'question_list'
      get 'users_list'
    end
  end


  root :to => "home#index"

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
