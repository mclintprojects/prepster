class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title
      t.integer :user_id
      t.boolean :is_public, default: false

      t.timestamps
    end
  end
end
