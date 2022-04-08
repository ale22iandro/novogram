class HomeController < ApplicationController
  # Извлекаем из базы все посты и выводим их в обертке pagy, по 5 постов на страницу
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc), items: 5)
  end
end
