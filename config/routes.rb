Rails.application.routes.draw do
  
  root "home#index"
  devise_for :users, controllers: {

    registrations: 'users/registrations',
    sessions: 'users/sessions'

  }
  resources :members
  resources :job_posts
  resources :applications

  
  get 'applications_disponibles_create', to: 'applications#disponiblescreate', as: 'applications_disponibles_create'


  get 'administrador/ver-empleos-publicados', to: 'job_posts#index', as: 'ver_empleos_publicados'
  get 'administrador/agregar-nueva-publicacion', to: 'job_posts#new', as: 'agregar_nueva_publicacion'
  get 'administrador/ver-notificaciones-nuevas', to: 'job_posts#notificaciones', as: 'ver_notificaciones_nuevas'
  
  get 'usuario/ver-postulaciones-disponibles', to: 'applications#disponibles', as: 'ver_postulaciones_disponibles'
  get 'usuario/ver-postulaciones-realizadas', to: 'applications#index', as: 'ver_postulaciones_realizadas'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
