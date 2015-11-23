class SearchesController < LayoutController

	def index
		@pages = Page.where('title LIKE(?)', "%#{params[:title]}%")
	end

end
