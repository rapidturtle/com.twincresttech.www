class RenameManufacturersLogo < ActiveRecord::Migration
  def change
    rename_column :manufacturers, :logo, :logo_id
  end
end
