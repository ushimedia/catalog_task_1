class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :score, null: false
      t.text :description
      t.bigint :user_id, null: false
      t.bigint :meeting_id, null: false

      t.timestamps
    end
  end
end
