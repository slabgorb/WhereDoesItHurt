class CreatePains < ActiveRecord::Migration[7.0]
  def change
    create_table :pains do |t|
      t.integer :level
      t.jsonb :location
      t.integer :sensation
      t.integer :internality
      t.text :comments

      t.timestamps
    end
  end
end
