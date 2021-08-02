class CardsController < ApplicationController
  def new
    @card = Card.new
    @list = List.find(params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    @list = List.find(params[:list_id])
    @card.list_id = @list.id
    if @card.save
      redirect_to root_path, notice: "カードを作成しました"
    else
      render action: :new
    end
  end

  def show
    @list = List.find(params[:list_id])
    @lists = List.where(user: current_user)
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to root_path, notice: "カード情報を変更しました"
    else
      redirect_to request.referer
      flash[:danger] = "カード情報を変更できませんでした"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to root_path, notice: "カードを削除しました"
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
    end
end
