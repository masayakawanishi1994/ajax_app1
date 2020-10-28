class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end
 
   # 削除
   # def new
   # end
 
  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end
 
  def checked
    post = Post.find(params[:id])##設定したURLパラメーターから既読したメモのidを使用して該当のレコードを取得
    if post.checked 
      post.update(checked: false)
    else
      post.update(checked: true)
    end
　　#既読であれば「既読を解除するためにfalseへ変更」し、既読でなければ「既読にするためtrueへ変更」
    item = Post.find(params[:id])
    render json: { post: item }
  end
  
end