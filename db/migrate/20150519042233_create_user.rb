class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, index: { unique: true }
      t.string :provider, index: true
      t.string :first_name
      t.string :last_name
      t.string :email, index: true
      t.string :auth_token

      t.timestamps
    end
  end
end
