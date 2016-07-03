class AddColumnToImage < ActiveRecord::Migration
  def change
    add_reference :images, :mobile, index: true, foreign_key: true
  end
end
