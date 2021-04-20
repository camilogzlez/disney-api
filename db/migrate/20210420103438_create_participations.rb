class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.references :character, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
