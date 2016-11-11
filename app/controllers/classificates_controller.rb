class ClassificatesController < ApplicationController

  before_filter :authenticate_user!

  before_action :get_classificates, :only => [:show, :update, :destroy, :edit ]

  load_and_authorize_resource

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
  end

  def edit
  end

  def update
    #通过ID找到数据库的这条记录

    #对这条记录进行更新操作
    @classificate.update classificate_params

    redirect_to classificates_path
  end

  def destroy
    @classificate.destroy

    redirect_to classificates_path
  end


  private
    def classificate_params
      params.require(:classificate).permit(:id,:fenlei)
    end

    def get_classificates
      @classificate = Classificate.find params[:id]
    end


end
