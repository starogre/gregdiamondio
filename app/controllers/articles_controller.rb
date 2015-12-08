class ArticlesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})

  def index
    @article = Article.new
    @articles = Article.all.sort do |x,y|
      y.created_at <=> x.created_at
    end

    @articles.map { |art| art.body = @@markdown.render art.body }
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    binding.pry
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def require_login
      redirect_to '/login' unless user_signed_in?
    end
end
