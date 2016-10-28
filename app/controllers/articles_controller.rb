class ArticlesController < ApplicationController
  def index

    @articles = Article

    @articles = @articles.where("classificate_id=?",params[:fenlei]) if params[:fenlei].present?

    @articles = @articles.all.page(params[:page]).per(5)
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
    @article = Article.find params[:id]
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title,:content,:classificate_id)
    end
end
