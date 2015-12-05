class SearchesController < LayoutController

	def index
	end

	def search
    	@pages = Page.where('title LIKE(?)', "%#{params[:title]}%").group(:title)
	end
end
