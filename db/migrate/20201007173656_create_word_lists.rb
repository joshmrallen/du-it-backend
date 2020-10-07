class CreateWordLists < ActiveRecord::Migration[6.0]
  def change
    create_table :word_lists do |t|
      t.bigint :user_id
      t.bigint :word_id

      t.timestamps
    end
  end
end
