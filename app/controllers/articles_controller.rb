class ArticlesController < ApplicationController
  impressionist actions: [:index]

  def index
    @article = Article.new
    @articles = Article.all.sort do |x,y|
      y.created_at <=> x.created_at
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to '/'
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
