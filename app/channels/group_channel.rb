class GroupChannel < ApplicationCable::Channel
    def subscribed
        group = Group.find params[:group_id]
        stream_for group
    end
end