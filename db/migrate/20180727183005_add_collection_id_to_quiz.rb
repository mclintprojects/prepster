class AddCollectionIdToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :collection_id, :integer
  end
end
