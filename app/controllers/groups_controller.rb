class GroupsController < LayoutController
  before_action :authenticate_user!, only: :index
  # before_action :move_to_search, only: :index
  # サインアップ後の/groups/search/ページへのリダイレクト

  def index
    @groups = current_user.groups
    @group = Group.new
  end

  # def new
  #   @group = Group.new
  # end

  def create
    group = Group.create(group_params)
    UsersGroup.create(user_id: current_user.id, group_id: group.id)
    redirect_to action: :index
  end

  def destroy
    # @group = Group.find(params[:group_id])
    group = Group.find(params[:id])
    group.destroy
    redirect_to action: :index
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
