class ChangeColumnTypeForPrice < ActiveRecord::Migration
  def change
    change_column :purchase_options, :price, :decimal, precision: 8, scale: 2
  end
end
