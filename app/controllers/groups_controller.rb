class GroupsController < LayoutController
  before_action :authenticate_user!, only: :index
  # before_action :move_to_search, only: :index
  # サインアップ後の/groups/search/ページへのリダイレクト

  def index
    @group = Group.new
    @groups = current_user.groups.order("created_at DESC")
  end

  # def new
  #   @group = Group.new
  # end

  def create
    group = Group.create(group_params)
    redirect_to action: :index
    UsersGroup.create(user_id: current_user.id, group_id: group.id)
  end

  def destroy
    group = UsersGroup.find_by(user_id: current_user.id, group_id: params[:id])
    #グループについている自分のUser_idのみ削除する。paramsは特に指定をしない場合にはidで取得される。そのため、こちらの記述はparams[:id]でOK
    group.destroy
    redirect_to action: :index
  end

  def search
    @pages = Page.where('title LIKE(?)', "%#{params[:title]}%").group(:title)
  end

  def reset_index
    @group = Group.new
    @groups = current_user.groups
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :avatar)
  end

  # 中間テーブル作成後に実行する（サインアップ後の/groups/search/ページへのリダイレクト）
  # def move_to_new
  #   redirect_to new_groups_path if user_signed_in? && !current_user.groups
  # end
end
