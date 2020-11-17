class CreatePapas < ActiveRecord::Migration[6.0]
  def change
    create_table :papas do |t|
      t.string     :name, null: false
      t.integer    :age_id, null: false
      t.integer    :marriage_id, null: false
      t.integer    :child_id, null: false
      t.string     :app_name, null: false
      t.text       :memo, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
