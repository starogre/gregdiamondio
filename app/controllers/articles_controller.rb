class ArticlesController < ApplicationController
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
    @article = Article.new(article_params)
    @article.save

    redirect_to root_path
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
