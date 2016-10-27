class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :show, :edit, :update, :destroy]

  def index
    @conversations = current_user.mailbox.conversations
    @notifications = current_user.mailbox.notifications.group_by &:sender_id
    @receipts = current_user.mailbox.receipts
    @message = current_user.mailbox.inbox.first.messages.first.body

  end

# GET /message/new
  def new
    @message = current_user.messages.new
    # display form
  end

# POST /message/create
  def create
    current_user.send_message(@recipient, params[:body], params[:subject])
    redirect_to :conversations, notice: t('passengers.create.success')
  end

  private

  def set_user
    @recipient = User.find(params[:id])
  end
end
