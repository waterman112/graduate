class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :logo
    end
  end
end
