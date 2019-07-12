# frozen_string_literal: true

class ProductsController < OpenReadController
  before_action :set_product, only: %i[update destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy

    head :no_content
  end

  def set_product
    @product = current_user.products.find(params[:id])
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:title, :user_id, :vendor, :description, :price, :sku_xs, :sku_s, :sku_m, :sku_l, :sku_xl, :img_url_1, :img_url_2, :img_url_3, :img_url_4)
    end
end
