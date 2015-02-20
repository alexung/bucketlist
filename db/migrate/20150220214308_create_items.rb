class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :title
      t.boolean :complete

      t.timestamps
    end
  end
end
