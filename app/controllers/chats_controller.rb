class ChatsController < ApplicationController

  before_action :authenticate_user!

  def index
    @chats = Chat.all
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(get_params)
    if @chat.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def get_params
    params.require(:chat).permit(:user_id, :message)
  end
end
