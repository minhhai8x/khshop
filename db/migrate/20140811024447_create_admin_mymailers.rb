class CreateAdminMymailers < ActiveRecord::Migration
  def change
    create_table :admin_mymailers do |t|
      t.string :e_title
      t.string :e_address
      t.integer :e_port
      t.string :e_domain
      t.string :e_username
      t.string :e_password

      t.timestamps
    end
  end
end
