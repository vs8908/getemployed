class CreateEventParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :event_participants do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :event_participants, [:event_id, :user_id]
    add_index :event_participants, [:user_id, :event_id]
  end
end
