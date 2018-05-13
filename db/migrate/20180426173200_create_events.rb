class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :location
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :public, default: false
      t.string :color, default: 'green'
      t.integer :user_id
      t.timestamps
    end
  end
end
