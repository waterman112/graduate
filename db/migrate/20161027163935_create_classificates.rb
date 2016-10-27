class CreateClassificates < ActiveRecord::Migration
  def change
    create_table :classificates do |t|
      t.string :fenlei
    end
  end
end
