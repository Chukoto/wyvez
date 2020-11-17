class CreateBeautyEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :beauty_events do |t|
      t.integer    :beauty_cate_id, null: false
      t.datetime   :started_at,     null: false
      t.text       :place,          null: true
      t.text       :memo,           null: true
      t.integer    :cost,           null: true
      t.integer    :status_id,      null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
