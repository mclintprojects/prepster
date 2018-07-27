class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :quiz_sessions, :completed
  end
end
