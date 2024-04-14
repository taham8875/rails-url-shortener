class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_code
      t.string :title
      t.string :description
      t.string :image
      t.integer :views_count

      t.timestamps
    end
  end
end
