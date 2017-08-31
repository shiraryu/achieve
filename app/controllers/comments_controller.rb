class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し、Blogに紐づくcommentsとしてbuildする
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    @notification = @comment.notifications.build(user_id: @blog.user.id)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }  # JS形式でレスポンスを返す
        unless @comment.blog.user_id == current_user.id
          Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'comment_created', {     #通知機能
            message: 'あなたの作成したブログにコメントが付きました'
          })
        end
          Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'notification_created', {    #ajaxでカウント数を書き換える処理
            unread_counts: Notification.where(user_id: @comment.blog.user.id, read: false).count
          })
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js { render :index }  # JS形式でレスポンスを返す
      else
        format.html { render :new }
      end
    end
  end

  private    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

end
