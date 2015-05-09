class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :user, null: false, index: true
      t.references :purchase_option, null: false, index: true

      t.timestamps null: false
    end
  end
end
