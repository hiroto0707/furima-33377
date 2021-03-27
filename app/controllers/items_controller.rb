class ItemsController < ApplicationController
  before_action :authenticate_user! 
  #特定のアクションだけ適応はどのアクションを適応すればいいか現在不明

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

 private
 def item_params
  params.require(:item).permit(:name, :).merge(user_id: current_user.id)
 end
 

end

#入力した商品情報がバリデーションを通過しなかった場合、再度「商品出品ページ」が表示されるように実装しましょう。バリデーション通過の可否を条件に処理を分岐させ、エラーメッセージが表示されるように適切なメソッドを用いて記述してください