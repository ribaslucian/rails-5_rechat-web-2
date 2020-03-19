class Message < ApplicationRecord
  # 1
  after_create_commit { ChatBroadcastJob.perform_later self }
  
  belongs_to :interactions
end
