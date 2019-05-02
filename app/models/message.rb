class Message < ApplicationRecord
  belongs_to :group, inverse_of: :messages
  belongs_to :user

  def as_json(options)
    super(options).merge(user_avatar_url: gravatar_url(current_user))
  end
end
