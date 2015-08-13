class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.text :description
      t.string :web_url
      t.string :support_url
      t.string :logo
      t.integer :position

      t.timestamps
    end
  end
end
