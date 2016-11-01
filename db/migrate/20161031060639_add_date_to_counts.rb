class AddDateToCounts < ActiveRecord::Migration
  def change
    add_column :counts, :date, :date
  end
end
