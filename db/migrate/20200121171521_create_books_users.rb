class CreateBooksUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :books_users do |t|
      t.references :books, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
