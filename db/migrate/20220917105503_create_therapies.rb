class CreateTherapies < ActiveRecord::Migration[7.0]
  def change
    create_table :therapies do |t|
      t.integer :action
      t.integer :efficacy
      t.integer :duration
      t.text :comment

      t.timestamps
    end
  end
end
