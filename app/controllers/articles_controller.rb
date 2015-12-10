class ArticlesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})

  def index
    @article = Article.new

    @articles = grab_sorted_articles
 end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    @articles = grab_sorted_articles

    render 'index'
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

  def grab_sorted_articles
    articles = Article.all.sort do |x,y|
      y.created_at <=> x.created_at
    end

    articles.each { |art| art.body = @@markdown.render art.body }
  end
end
