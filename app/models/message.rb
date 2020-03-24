class Message < ApplicationRecord
  # 1
  after_create_commit { ChatBroadcastJob.perform_later self }
  
  belongs_to :interaction, optional: true
  
  belongs_to :origin_user, class_name: 'User', foreign_key: :origin_user_id, optional: true
  belongs_to :destiny_user, class_name: 'User', foreign_key: :destiny_user_id, optional: true
  belongs_to :previous_message, class_name: 'User', foreign_key: :previous_message_id, optional: true
end
