class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :vendor
      t.string :description
      t.integer :price
      t.integer :sku_xs
      t.integer :sku_s
      t.integer :sku_m
      t.integer :sku_l
      t.integer :sku_xl
      t.string :img_url_1
      t.string :img_url_2
      t.string :img_url_3
      t.string :img_url_4

      t.timestamps
    end
  end
end
