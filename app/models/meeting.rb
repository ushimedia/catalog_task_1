class Meeting < ApplicationRecord
    belongs_to :user
    validates :name, :goal, presence: true
    enum status: { 完了: 0, 議論中: 1, 保留: 2 }

end
