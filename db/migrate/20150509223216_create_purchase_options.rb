class CreatePurchaseOptions < ActiveRecord::Migration
  def change
    create_table :purchase_options do |t|
      t.decimal :price, null: false
      t.string :quality
      t.references :movie, index: true

      t.timestamps null: false
    end
  end
end
