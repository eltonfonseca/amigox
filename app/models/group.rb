class Group < ApplicationRecord
    has_many :messages, dependent: :destroy, inverse_of: :group
    has_and_belongs_to_many :users
end
