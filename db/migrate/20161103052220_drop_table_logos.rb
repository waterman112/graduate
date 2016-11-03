class DropTableLogos < ActiveRecord::Migration
  def change
    drop_table :logos
  end
end
