class CreatePapaEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :papa_events do |t|
      t.datetime   :started_at,      null: false
      t.datetime   :finished_at,     null: true
      t.integer    :do_what_id,      null: true
      t.text       :todo,            null: true
      t.text       :place,           null: true
      t.integer    :expected_reward, null: false
      t.integer    :reward,          null: true
      t.integer    :status_id,       null: false
      t.references :papa, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
