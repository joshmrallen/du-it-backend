class RemoveNumOfPagesFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :num_of_pages, :integer
  end
end
