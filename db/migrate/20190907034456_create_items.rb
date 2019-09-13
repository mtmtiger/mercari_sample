class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,               null: false
      t.integer :price,              null: false
      t.text    :introduct,          null: false
      t.string  :size
      t.integer :condition,          null: false,default: 0
      t.boolean :postage,            default: false
      t.integer :prefecture_id,      null: false
      t.integer :shipping_date,      null: false,default: 0
      t.integer :saler_id,            null: false
      t.integer :buyer_id
      t.integer :category_id
      t.boolean :transact,        default: false
      t.timestamps
    end
  end
end
