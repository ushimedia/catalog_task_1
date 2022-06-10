class AddNameToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :name, :string, null: false
    add_column :meetings, :agenda, :text
    add_column :meetings, :goal, :text, null: false
    add_column :meetings, :minutes, :text
    add_column :meetings, :status, :integer, null: false, default: 0
    add_column :meetings, :start_meeting, :datetime, null: false
    add_column :meetings, :end_meeting, :datetime
    add_column :meetings, :hold_time, :integer, null: false
    add_reference :meetings, :user, null: false, foreign_key: true
  end
end
