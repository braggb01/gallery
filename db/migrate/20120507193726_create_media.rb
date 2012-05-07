class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :attachment
      t.integer :album_id

      t.timestamps
    end
  end
end
