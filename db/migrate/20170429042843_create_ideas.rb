class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
