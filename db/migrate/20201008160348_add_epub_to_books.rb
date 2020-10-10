class AddEpubToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :epub, :bytea
  end
end
