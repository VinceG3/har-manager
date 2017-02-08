class CreateHarfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :harfiles do |t|
      t.string :name
      t.text :contents

      t.timestamps
    end
  end
end
