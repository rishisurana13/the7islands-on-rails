class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :vendor, :description, :price, :sku_xs, :sku_s, :sku_m, :sku_l, :sku_xl, :img_url_1, :img_url_2, :img_url_3, :img_url_4, :user_id
end
