class Message < ApplicationRecord
  # 1
  after_create_commit { ChatBroadcastJob.perform_later self }
  
  belongs_to :interactions
  
  belongs_to :sent_user, class_name: 'User', foreign_key: :sent_user_id
  belongs_to :received_user, class_name: 'User', foreign_key: :received_user_id
  belongs_to :father_message, class_name: 'User', foreign_key: :father_message_id
end
