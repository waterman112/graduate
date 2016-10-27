class AddClassificateIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :classificate_id, :integer
  end
end
