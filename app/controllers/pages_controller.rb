class PagesController < LayoutController
  def index
    #@pages = Page.where(group_id: params[:group_id]).page(params[:page]).per(6).order("created_at DESC")
    @pages = Page.where(group_id: params[:group_id]).order("created_at DESC") #ページネーションなし
    @group = Group.find(params[:group_id])
    @page = Page.new
  end

  # def new
  #   @group = Group.find(params[:group_id])
  #   @page = Page.new
  # end

  def show
  end

  def create
    Scraping.page_titles(page_params)
    # Page.create(page_params)
    # UsersPage.create(user_id: current_user.id, page_id: page.id)
    page = Page.last
    page.user_id = current_user.id
    page.save
    UsersPage.create(user_id: current_user.id, page_id: page.id)
    redirect_to action: :index unless params[:group_id].nil?
    redirect_to controller: :users, action: :show, id: current_user.id
  end

  def destroy
    # @group = Group.find(params[:group_id])
    page = Page.find(params[:id])
    page.destroy
    redirect_to action: :index
  end

  def search
  end

  private
  def page_params
    params.require(:page).permit(:url).merge(group_id: params[:group_id])
  end



end
