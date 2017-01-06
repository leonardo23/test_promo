class CategoriesController < ApplicationController
	def index
		@categories = Category.order("created_at DESC")
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params_category).set_created_by(current_user)
		if @category.valid?
			@category.save
			redirect_to categories_path, :flash => {:notice => "Data berhasil disimpan."}
		else
			flash[:error] = @category.errors.full_messages.to_sentence
			render 'new'
		end
	end

	def show
		@category = Category.find(params[:id])
		@products = @category.products
	end

	private

	def params_category
		params.require(:category).permit(:category_name)
	end
end
