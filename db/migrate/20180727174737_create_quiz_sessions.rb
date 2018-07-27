class CreateQuizSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_sessions do |t|
      t.string :player
      t.integer :score
      t.integer :quiz_id

      t.timestamps
    end
  end
end
