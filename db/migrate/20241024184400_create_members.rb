class CreateMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :role
      t.string :encrypted_password

      t.timestamps
    end
  end
end
