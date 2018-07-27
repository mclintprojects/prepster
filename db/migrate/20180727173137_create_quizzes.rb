class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :duration
      t.boolean :is_public, default: false
      t.string :sessions
      t.string :integer
      t.boolean :is_completed, default: false
      t.string :identifier
      t.integer :user_id

      t.timestamps
    end
  end
end
