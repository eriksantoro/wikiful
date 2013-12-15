class CategoriesController <ApplicationController

	def index
		@categories = Category.order(name: :asc).limit(25)
	end

	def show
		@categories = Category.find(params[:id])
	end

end
