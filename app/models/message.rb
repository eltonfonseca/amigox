class Message < ApplicationRecord
  belongs_to :group, inverse_of: :messages
  belongs_to :user
end
