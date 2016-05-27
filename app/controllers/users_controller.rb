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
    redirect_to action: :index
  end

  def destroy
    user = UsersGroup.find_by(user_id: params[:id], group_id: params[:group_id])
    user.destroy
    redirect_to action: :index
  end

  def show
    @page = Page.new
    @pages = Page.where(user_id: current_user.id).group("url").order("created_at DESC")
    # @page = Page.new
  end

  def edit
    # @user = User.find_by(id: params[:current_user.id])
    @user = current_user
  end

  def update
  # binding.pry
    user = User.find_by(id: current_user.id)
    user.update(user_params)
    redirect_to action: :show
  end


  # def create
  #   Scraping.page_titles(page_params)
  #   page = Page.last
  #   page.user_id = current_user.id
  #   page.save
  #   UsersPage.create(user_id: current_user.id, page_id: page.id)
  #   redirect_to action: :show
  # end

  private
  def id_params
    params.permit(:user_id)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :avatar)
  end

  def page_params
    params.require(:page).permit(:url)
  end



end
