class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,         nill: false
      t.integer     :price,        nill: false
      t.text        :description,  nill: false
      t.integer     :category_id,  nill: false
      t.integer     :status_id,    nill: false
      t.integer     :cost_id,      nill: false
      t.integer     :prefecture_id,nill: false
      t.integer     :days_id,      nill: false
      t.integer     :user_id,     foreign_key: true, nill: false










      t.timestamps
    end
  end
end
