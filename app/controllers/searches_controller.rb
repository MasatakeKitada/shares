class SearchesController < LayoutController

	def index
		redirect_to action: :search
	end

	def search
    	@pages = Page.where('title LIKE(?)', "%#{params[:title]}%").where(user_id: current_user.id).group(:title)
	end
end
