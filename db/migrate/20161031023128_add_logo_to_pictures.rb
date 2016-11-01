class AddLogoToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :logo, :string
  end
end
