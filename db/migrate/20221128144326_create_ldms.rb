class CreateLdms < ActiveRecord::Migration[7.0]
  def change
    create_table :ldms do |t|
      t.text :missions_content
      t.string :company_name
      t.string :job_title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
