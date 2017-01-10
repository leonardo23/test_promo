class ProductsController < ApplicationController
	before_filter :get_current_category, :only => [:new, :create]
	before_filter :get_vendors, :only => [:new, :create]
	def index;end

	def new
		@product = @category.products.build
	end

	def create
		@product = @category.products.build(params_product).set_created_by(current_user)
		if @product.valid?
			@category.save
			redirect_to category_path(@category), :flash => {:notice => "Data Product Berhasil disimpan."}
		else
			flash[:error] = @product.errors.full_messages.to_sentence
			render 'new'
		end
	end

	def show
		@cart = Cart.new
		@cart_details = CartDetail.new
		@product = Product.find(params[:id])
		@current_cart = @cart.get_transaction_number(current_user)[:cart_history]
		if @current_cart.present?
			@history_cart_details = @current_cart.cart_details.grouping_qty
		else
			@history_cart_details = []
		end
	end

	private

	def get_current_category
		@category = Category.find(params[:category])
	end

	def get_vendors
		@vendors = Vendor.order("created_at DESC")
	end

	def params_product
		params.require(:product).permit(:item_code, :item_description, :item_quantity, :item_price, :vendor_id, :created_by, :updated_by)
	end
end
