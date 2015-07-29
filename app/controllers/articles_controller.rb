class ArticlesController < ApplicationController
  def index
    @article = Article.new
    @articles = Article.all.sort do |x,y|
      y.created_at <=> x.created_at
    end
  end

   def create
     @article = Article.new(article_params)
     @article.save

     redirect_to '/'
   end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
