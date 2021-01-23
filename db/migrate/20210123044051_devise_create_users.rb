# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :provider
      t.string :uid
      t.string :display_name
      t.string :image

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
