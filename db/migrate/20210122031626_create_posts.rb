class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string  :name,                 null: false
      t.text    :info,                 null: false
      t.integer :flavor_id,            null: false
      t.integer :region_id,            null: false
      t.integer :body_id,              null: false
      t.integer :acidity_id,           null: false
      t.integer :processing_id,        null: false
      t.string  :text,                 null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
