class ClassificatesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  layout "classificate"

  def index
    @classificates = Classificate.all
  end

  def new
    @classificate = Classificate.new
  end

  def create
    classificate = Classificate.create(classificate_params)

    redirect_to classificate
  end

  def show
    @classificate = Classificate.find params[:id]
  end

  def edit
    @classificate = Classificate.find params[:id]

  end

  def update
    #通过ID找到数据库的这条记录
    @classificate = Classificate.find params[:id]
    #对这条记录进行更新操作
    @classificate.update classificate_params

    redirect_to classificates_path
  end

  def destroy
    @classificate = Classificate.find params[:id]
    @classificate.destroy

    redirect_to classificates_path
  end


  private
    def classificate_params
      params.require(:classificate).permit(:id,:fenlei)
    end
end
