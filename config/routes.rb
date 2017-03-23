Rails.application.routes.draw do
  mount Mercury::Engine => '/'
  put 'mercury_update' => 'my_mercury#update'
  root 'static_pages#home'
  get 'packman' => 'static_pages#packman'
  get 'resume' => 'resume#show', as: 'resume'
  get 'login'  => 'sessions#new'
  post 'login'  => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :posts, param: :slug, path: 'blog', only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :tags, param: :slug, path: 'experience', only: [:index, :show]

  scope :browser do
    get '/ie8' => 'browser_exception#ie8'
    get '/not_modern' => 'browser_exception#not_modern'
  end

  scope :admin, module: :admin, as: 'admin' do
    get '/' => 'static_pages#home', as: 'root'
    resources :certifications, except: :show
    resources :posts
    resources :educations, except: :show
    resources :occupations, except: :show
    resources :projects, except: :show
    resources :tags, except: :show
    get '/:object_type/:object_id/versions' => 'versions#index',
      as: 'versions'
    get '/:object_type/:object_id/version/:id/diff' => 'versions#diff',
      as: 'diff_version'
    get '/:object_type/:object_id/version/:id/restore' => 'versions#restore',
      as: 'restore_version'
  end
end
