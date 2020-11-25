class Entry < ApplicationRecord
    validate :error_check
    def error_check
      if user_id.blank?
        errors[:base] << 'ユーザーIDは必ず入力してください。'
      end
      if weight.blank?
        errors[:base] << '体重は必ず入力してください。'
      end
      if height.blank?
        errors[:base] << '身長は必ず入力してください。'
      end
    end

    validates :day, :user_id, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  
end
