class ArticlesController < ApplicationController
  before_action :get_article, :only => [:show, :edit, :update, :destroy]

  before_action :update_pv, :only => [:show]
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

    redirect_to @article
  end

  def show
    puts "===hihihi"

  end

  def edit
  end

  def update
#    @article.title = params[:article][:title]
#    @article.update_attributes params[:article]
     @article.update article_params


    redirect_to articles_path
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end
  #
#  很重要的一段代码
  #  这个地方是在 routes.rb中定义了一个路由。
  #
  def tongjitu

    # 这里我调用了Article模型内部的方法tongji. 很好的实现了，将逻辑代码存放到model中，
    # 让controller实现了对 路由动作的专注。
    @x_axis = Article.tongji[:x]
    @daily_pvs = Article.tongji[:y]

		#@x_axis = Count.all.map{ |count|  "'#{count.date}'" }.join(',')
		#@daily_pvs = Count.all.map { |count| count.counts }.join(',')
  end

  private
  def get_article
   # puts "=== hihihi, in before_action, get_article"
    @article = Article.find params[:id]
  end

  def article_params
    params.require(:article).permit(:title,:content,:classificate_id)
  end

  def update_pv
    today_date =  Time.now.strftime('%Y-%m-%d')

    @count = Count.where('date = ? ', today_date ).first

    if @count.blank?
      @count = Count.create :date => today_date , :counts => 0
    end

    @count.counts = @count.counts + 1
    @count.save!
  end

end
