Rails.application.routes.draw do
  mount Mercury::Engine => '/'
  put 'mercury_update' => 'my_mercury#update'
  root 'static_pages#home'
  get 'resume' => 'resume#show', as: 'resume'
  get 'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :posts, param: :slug, path: 'blog', only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :tags, param: :slug, path: 'skills', only: [:index, :show]

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
