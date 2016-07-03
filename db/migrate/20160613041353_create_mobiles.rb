class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.string :company
      t.string :product
      t.string :specs
      t.string :price

      t.timestamps null: false
    end
  end
end
