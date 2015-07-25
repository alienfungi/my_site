Rails.application.routes.draw do
  get '/resume' => 'resume#show', as: 'resume'

  root 'static_pages#home'

  get  'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get  'logout' => 'sessions#destroy'

  scope :browser do
    get '/ie8' => 'browser_exception#ie8'
    get '/not_modern' => 'browser_exception#not_modern'
  end

  scope :admin do
    get '/' => 'admin#home', as: 'admin'
    resources :certifications
    resources :educations
    resources :occupations
    resources :projects
    resources :tags
  end
end
