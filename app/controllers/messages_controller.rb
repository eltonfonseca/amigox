class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_entities

  def create
    @message = Message.create user: current_user,
                                       group: @group,
                                       message: params.dig(:message, :message)
    GroupChannel.broadcast_to @group, @message
  end

  protected

  def load_entities
    @group = Group.find params.dig(:message, :group_id)
  end
end
