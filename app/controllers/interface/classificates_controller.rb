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
end
