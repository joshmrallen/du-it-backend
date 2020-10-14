class AddIndexToCollections < ActiveRecord::Migration[6.0]
  def change
    add_index :collections, :user_id
    add_index :collections, :book_id
  end
end
