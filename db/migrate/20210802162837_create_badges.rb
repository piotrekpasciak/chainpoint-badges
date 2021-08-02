class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :recipent_name, null: false
      t.date   :issue_date, null: false
      t.uuid   :uuid, null: false
      t.uuid   :proof_id, null: false
      t.string :hash, null: false
      t.jsonb  :metadata, null: false, default: '{}'
      t.timestamps
    end

    add_index :badges, :uuid, unique: true
    add_index :badges, :proof_id, unique: true
    add_index :badges, :hash, unique: true
  end
end
