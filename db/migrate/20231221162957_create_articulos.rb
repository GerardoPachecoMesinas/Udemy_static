class CreateArticulos < ActiveRecord::Migration[7.1]
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.text :contenido
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
