class RemoveDate < ActiveRecord::Migration
  def change
    remove_column :counts, :date, :string
  end
end
