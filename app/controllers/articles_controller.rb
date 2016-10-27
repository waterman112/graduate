class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
   # render :text => 'alalalal'
    redirect_to @article
  end

  def show
    @article = Article.find params[:id]
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    Article.update @article

    redirect_to articles_path
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(:title,:content)
    end
end
