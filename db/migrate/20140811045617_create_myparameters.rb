class CreateMyparameters < ActiveRecord::Migration
  def change
    create_table :myparameters do |t|
      t.string :pr_name
      t.string :pr_type
      t.string :pr_value
      t.integer :pr_status

      t.timestamps
    end
  end
end
