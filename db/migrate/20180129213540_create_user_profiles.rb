class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def up
    create_table :user_profiles do |t|
      t.integer "user_id"
      t.string "name"
      t.string "qr_id",      :null => false
      t.string "firebase_id", :default => "", :null => false
      t.timestamps
    end
    add_index("user_profiles", "user_id")
  end

  def down
    # don't need to drop indexes when dropping the whole table
    drop_table :user_profiles
  end
end
