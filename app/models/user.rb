class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  has_and_belongs_to_many :groups
  belongs_to :friend, class_name: 'User', foreign_key: 'user_id', optional: true
  has_one :user, foreign_key: 'user_id', dependent: :nullify
  
  def raffle(users)
    @friends = users.to_a.shuffle!
    qtd = @friends.count
    for i in 0..qtd - 1
      @friends[i].friend = @friends[(i + 1) % qtd]
      @friends[i].save
    end
  end
end
