class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,         null: false
      t.integer     :price,        null: false
      t.text        :description,  null: false
      t.integer     :category_id,  null: false
      t.integer     :status_id,    null: false
      t.integer     :cost_id,      null: false
      t.integer     :prefecture_id,null: false
      t.integer     :days_id,      null: false
      t.integer     :user_id,     foreign_key: true, null: false
      
      










      t.timestamps
    end
  end
end
