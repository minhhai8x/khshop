class CreateMycompares < ActiveRecord::Migration
  def change
    create_table :mycompares do |t|
      t.integer :product_id

      t.timestamps
    end
  end
end
