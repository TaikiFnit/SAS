class MessagesController < ApplicationController
  def create
    data = message_params
    data[:user_id] = current_user.id

    @message = Message.new(data)

    if @message.save then
      redirect_to course_path(@message.course_id)
    end
  end

  def update
  end

  def destroy
    # TODO : 削除のpermissionが存在するかどうかcheck
    @message = Message.find(params[:id])
    @message.destroy

    # TODO: 直接アクセスされた場合の処理
    # http://qiita.com/azusanakano/items/8af1266f53a656ef787d
    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:body, :course_id, :attr)
  end

end
