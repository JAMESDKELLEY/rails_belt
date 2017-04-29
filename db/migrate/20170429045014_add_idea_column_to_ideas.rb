class AddIdeaColumnToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :idea, :string
  end
end
