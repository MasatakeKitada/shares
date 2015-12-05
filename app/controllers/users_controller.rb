class UsersController < LayoutController

  def index
    @group = Group.find(params[:group_id])
    @users = @group.users
  end

  def invite
    @group = Group.find(params[:group_id])
    user_ids_in_group = @group.users.map(&:id)
    @users = User.where('nickname LIKE(?)', "%#{params[:nickname]}%").where.not(id: user_ids_in_group)
  end

  def add
    UsersGroup.create(user_id: id_params[:user_id], group_id: params[:group_id])
    redirect_to action: :invite
  end

  def destroy
    user = UsersGroup.find_by(user_id: params[:id], group_id: params[:group_id])
    user.destroy
    redirect_to action: :index
  end

  def show
    @pages = Page.where(user_id: current_user.id)
  end

  private
  def id_params
    params.permit(:user_id)
  end

end
