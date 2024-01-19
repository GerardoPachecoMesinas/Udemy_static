class CreateAutors < ActiveRecord::Migration[7.1]
  def change
    create_table :autors do |t|
      t.string :name
      t.string :last_name
      t.integer :age
      t.string :nationality

      t.timestamps
    end
  end
end
