Blogit::Engine.routes.draw do

  # Keep these above the posts resources block
  match "posts/page/:page" => "posts#index", via: [:get, :post]
  match "posts/tagged/:tag" => 'posts#tagged', via: [:get, :post], as: :tagged_blog_posts

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  match "/" => "posts#index", via: [:get, :post], as: :blog_root
end
