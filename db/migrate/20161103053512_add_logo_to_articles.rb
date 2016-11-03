class AddLogoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :logo, :string , default:'', comment:"保存截图路径"
  end
end
