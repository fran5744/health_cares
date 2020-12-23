class Entry < ApplicationRecord
  validate :error_check
  def error_check
      if user_id.blank?
        errors[:base] << 'ユーザーIDは必ず入力してください。'
      elsif day.present?
        entry_check = Entry.find_by(user_id: user_id, day: day)
        if entry_check.present?
          errors[:base] << 'その日のデータは、すでに登録済みです。'
        end
      end
      if weight.blank?
        errors[:base] << '体重は必ず入力してください。'
      end
      if height.blank?
        errors[:base] << '身長は必ず入力してください。'
      end
      
    end

  
end
