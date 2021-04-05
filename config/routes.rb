Rails.application.routes.draw do
  root to: 'websites#index'
  resources :websites do
    resources :blog_posts, shallow: true
  end
end
