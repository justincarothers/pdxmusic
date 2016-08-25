class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :title
      t.text :description
      t.string :band

      t.timestamps null: false
    end
  end
end
