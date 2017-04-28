
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/scores' => 'scores#index'
      get '/scores/new' => 'scores/new' # uneccesary for API world b/c no form needed
      post '/scores' => 'scores#create'
      get '/scores/:id' => 'scores#show'
      patch '/scores/:id' => 'scores#update'
      delete '/scores/:id' => 'scores#destroy'
    end

      namespace :v2 do
      get '/scores' => 'scores#index'
      get '/scores/new' => 'scores/new' # uneccesary for API world b/c no form needed
      post '/scores' => 'scores#create'
      get '/scores/:id' => 'scores#show'
      patch '/scores/:id' => 'scores#update'
      delete '/scores/:id' => 'scores#destroy'
    end
  end

  get '/scores' => 'scores#index'
end
