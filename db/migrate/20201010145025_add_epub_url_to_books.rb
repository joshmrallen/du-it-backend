class AddEpubUrlToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :epub_url, :string
  end
end
