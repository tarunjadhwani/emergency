class AddBookToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :book, :boolean, null: false, default: false
  end
end
