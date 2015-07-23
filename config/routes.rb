Rails.application.routes.draw do


  # get 'activities/index'
  #
  # get 'activities/show'

  # get 'parents/index'

  # get 'students/index'

  # get 'teachers/index'

  resources :activities

  resources :teachers

  resources :students

  resources :parents

  post 'students/invite' => 'students#invite', as: :invite_student

  get 'activities/:activity_id/choose_students' => 'activities#choose_students', as: :choose_students

  get 'activities/:activity_id/add_student' => 'activities#add_student', as: :add_student
  get 'activities/:activity_id/remove_student' => 'activities#remove_student', as: :remove_student

  match 'activities/:activity_id/student_sign_up' => 'activities#student_sign_up', as: :student_sign_up, via: :all

  match 'activities/:activity_id/confirmAttendance/:student_id' => 'activities#confirmAttendance', as: :activity_attendance, via: :all

  # devise_for :users, controllers: {
  #       sessions: 'users/sessions',
  #       registrations: 'users/registrations'
  #     }

  # devise_for :users
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/about' => 'welcome#about'


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
