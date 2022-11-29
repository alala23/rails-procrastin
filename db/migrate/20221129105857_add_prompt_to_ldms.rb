class AddPromptToLdms < ActiveRecord::Migration[7.0]
  def change
    add_column :ldms, :prompt, :text
  end
end
