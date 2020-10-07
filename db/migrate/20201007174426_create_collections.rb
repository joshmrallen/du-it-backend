class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.bigint :user_id
      t.bigint :book_id

      t.timestamps
    end
  end
end
