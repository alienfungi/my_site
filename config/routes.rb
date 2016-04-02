Rails.application.routes.draw do
  root 'static_pages#home'
  get 'resume' => 'resume#show', as: 'resume'
  get 'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :tags, only: [:index]
  get 'blog' => 'posts#index'
  get 'blog/:slug' => 'posts#show', as: 'blog_post'
  get 'tags/:slug' => 'tags#show', as: 'tag'

  scope :browser do
    get '/ie8' => 'browser_exception#ie8'
    get '/not_modern' => 'browser_exception#not_modern'
  end

  scope :admin, module: :admin, as: 'admin' do
    get '/' => 'static_pages#home', as: 'root'
    resources :certifications
    resources :posts
    resources :educations
    resources :occupations
    resources :projects
    resources :tags
  end
end
