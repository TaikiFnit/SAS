class RepliesController < ApplicationController
  def create
    data = reply_params
    data[:user_id] = current_user.id

    @reply = Reply.new(data)

    if @reply.save then
      redirect_to :back
    end

  end

  def update
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    redirect_to :back
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :message_id, :value)
  end
end
