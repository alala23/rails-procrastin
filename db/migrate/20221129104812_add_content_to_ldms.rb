class AddContentToLdms < ActiveRecord::Migration[7.0]
  def change
    add_column :ldms, :content, :text
  end
end
