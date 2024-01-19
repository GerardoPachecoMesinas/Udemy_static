Rails.application.routes.draw do

  resources :comments

  # get 'autores/index'
  # get 'autores/new'
  resources :autores, as: :autores, only: :index
  resources :autores, as: :autor

  # get 'articulos/new'
  # get 'articulos/index'
  resources :articulos

  get 'home/index'
  root "home#index"

  get 'contacto', to: 'statics#contact'
  get 'nosotros', to: 'statics#about_us'
  get 'statics/privacy' #este es el tercer paso para la creacion de una nueva view y consta de crear la ruta hacia dicha vista en este archivo
  
  get 'suma', to: 'statics#sum_form'
  post 'statics/sum'
  get 'resultado', to: 'statics#result_form'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end