class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title,               null: false
      t.text        :item_description,    null: false
      t.integer     :category_id,         null: false
      t.integer     :item_state_id,       null: false
      t.integer     :shipping_cost_id,    null: false
      t.integer     :shipping_area_id,    null: false
      t.integer     :shipping_time_id,    null: false
      t.integer     :cost,                null: false
      t.references  :user,                foreign_key: true

      t.timestamps
    end
  end
end
