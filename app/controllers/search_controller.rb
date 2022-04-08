class SearchController < ApplicationController
  # создаем коллекцию постов по хэштэгу или описанию
  def index
    if params[:query].start_with?('#')
      query  = params[:query].gsub('#', '')
      @posts = Post.joins(:hash_tags).where(hash_tags: {name: query})
    else
      @posts = Post.where("description like ?", "%#{params[:query]}%")
    end
  end
  # создаем коллекцию постов, которые лайкнул текущий пользователь
  def favorites
      @posts = Post.all
      @liked_posts =[]
      @posts.each do |post|
        if post.liked?(current_user)
          @liked_posts << post
        end
      end
      @posts = @liked_posts
      render 'favorites'
  end
end