Rails.application.routes.draw do
  get '/resume' => 'resume#show', as: 'resume'

  root 'static_pages#home'

  scope :browser do
    get '/ie8' => 'browser_exception#ie8'
    get '/not_modern' => 'browser_exception#not_modern'
  end

  scope :admin do
    get '/' => 'admin#home', as: 'admin'
    resources :certifications
    resources :educations
    resources :occupations
    resources :tags
  end
end
