class Message < ApplicationRecord
  # 1
  after_create_commit { broadcast_if_raw_message }
  
  belongs_to :interaction, optional: true
  
  belongs_to :origin_user, class_name: 'User', foreign_key: :origin_user_id, optional: true
  belongs_to :destiny_user, class_name: 'User', foreign_key: :destiny_user_id, optional: true
  belongs_to :previous_message, class_name: 'User', foreign_key: :previous_message_id, optional: true
  
  def broadcast_if_raw_message
    if self.interaction_id.nil?
      ChatBroadcastJob.perform_later self
    end
  end
end
