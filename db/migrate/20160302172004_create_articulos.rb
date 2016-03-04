class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :texto

      t.timestamps null: false
    end
  end
end
