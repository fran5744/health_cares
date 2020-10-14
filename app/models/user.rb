class User < ApplicationRecord
    validate :error_check
    def error_check
      if user_id.blank?
        errors[:base] << 'ユーザーIDは必ず入力してください。'
      end
  
      if ps.blank?
          errors[:base] << 'パスワードは必ず入力してください。'
      end
  
      if name.blank?
          errors[:base] << '名前は必ず入力してください。'
      end
  
      if authority.blank?
          errors[:base] << '権限は必ずどちらか押してください。'
      end
    end
  
end
