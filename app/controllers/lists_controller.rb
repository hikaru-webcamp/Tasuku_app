class ListsController < ApplicationController
before_action :authenticate_user!
before_action :set_list, only: %i(edit update)

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

private
#mergeメソッドは2つのハッシュを統合するメソッドです。今回は誰がリストを作成したかという情報がほしいため。
#これにより、@list.user_id = current_user.idの記述が省略できる。すでに誰がリストを作成した情報を載せているため。
  def list_params
    params.require(:list).permit(:title)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
