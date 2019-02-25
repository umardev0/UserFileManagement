class CreateDocuments < ActiveRecord::Migration[5.1]
  def up
    create_table :documents do |t|
      t.integer "user_id"
      t.string "document_name", :default => ""
      t.timestamps
    end
    add_index("documents", "user_id")
    add_index("documents", "document_name")
  end

  def down
    # don't need to drop indexes when dropping the whole table
    drop_table :documents
  end
end
