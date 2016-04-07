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
    get '/:object_type/:object_id/versions' => 'versions#index',
      as: 'versions'
    get '/:object_type/:object_id/version/:id/diff' => 'versions#diff',
      as: 'diff_version'
    get '/:object_type/:object_id/version/:id/restore' => 'versions#restore',
      as: 'restore_version'
  end
end
