class AddSessionCompleted < ActiveRecord::Migration[5.2]
  def change
    add_column :quiz_sessions, :completed, :boolean, default: false
  end
end
