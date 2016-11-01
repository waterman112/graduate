class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.string :date
      t.integer :counts
    end
  end
end
