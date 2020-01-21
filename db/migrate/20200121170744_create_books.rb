class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :cover_image
      t.string :author
      t.string :publisher
      t.integer :page_count
      t.string :genre

      t.timestamps
    end
  end
end
