class CreateSharedDocuments < ActiveRecord::Migration[5.1]
  def up
    create_table :shared_documents do |t|
      t.integer "sender_id"
      t.integer "receiver_id"
      t.integer "document_id"
      t.timestamps
      end

      add_index :shared_documents, :sender_id
      add_index :shared_documents, :receiver_id
      add_index :shared_documents, :document_id
  end

  def down
    # don't need to drop indexes when dropping the whole table
    drop_table :shared_documents
  end
end
