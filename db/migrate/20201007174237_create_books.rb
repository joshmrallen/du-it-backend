class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :num_of_pages
      t.bigint :genre_id
      t.bigint :author_id

      t.timestamps
    end
  end
end
