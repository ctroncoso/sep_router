SepRouter::Application.routes.draw do


  devise_for :users

  match 'loader/full' => 'iseries_loader#render_full'
  match 'loader/pacientes' => 'iseries_loader#render_pacientes'
  match 'loader/examenes' => 'iseries_loader#render_examenes'
  match 'loader/ultimos' => 'iseries_loader#render_full_n'
  match 'loader/load' => 'iseries_loader#load'
  match 'loader/session' => 'iseries_loader#my_session'
  match 'estadistica_por_fecha/examenes/carga' => "ExamStatistics#index" , :as => 'estadistica_carga_examenes'
  match 'estadistica_por_fecha/pacientes_por_prestacion/:prestacion' => "ExamStatistics#pacientes", :as => 'estadistica_pacientes'
  match 'prestaciones/carganuevos' => 'prestaciones#agrega_nuevas_prestaciones'
  
  resources :colas do
    get 'pacientes', :on => :member
    get 'terminar', :on => :collection
  end

  resources :prestaciones do
    resources :punto_servicios
  end

  resources :punto_servicios

  resources :patients do
    get 'service_end', :on => :member
    resources :exams do
      resources :puntos_servicio
    end
  end
  resources :exams



  root :to => 'colas#index'


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
