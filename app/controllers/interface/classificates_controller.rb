class Interface::ClassificatesController < ActionController::Base
  def all
    render :json => {
      :result => Classificate.all.map {  |classificate|
        {
          :name => classificate.fenlei
        }
      }
    }
  end

  #def draw
  #  render :json => {
  #   :result => "success"
  #  }
  #end

  def draw
    render :json => {

     :data => {

     }
    }  end
end
