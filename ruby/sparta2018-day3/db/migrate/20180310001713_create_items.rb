class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :seller_id
      t.string :email
      t.text :image_url

      t.timestamps
    end
  end
end
