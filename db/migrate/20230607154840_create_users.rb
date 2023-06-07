class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email_address, unique: true
      t.string :phone_no
      t.string :role, default: "USER"

      t.timestamps
    end
  end
end
