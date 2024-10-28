class CreateApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job_post, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
