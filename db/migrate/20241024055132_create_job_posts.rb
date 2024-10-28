class CreateJobPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.references :created_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
