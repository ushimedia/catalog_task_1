class Meeting < ApplicationRecord
    belongs_to :user
    validates :name, :goal, presence: true
    validate :start_end_check, on: :update
    enum status: { 完了: 0, 議論中: 1, 保留: 2 }
    
    def start_end_check
        errors.add(:end_meeting, "の時間は会議開始より後の時刻で修正ください。") unless
        self.start_meeting < self.end_meeting
      end
end
