class AddLogoContentTypeToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :logo_content_type, :string
  end
end
