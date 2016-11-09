class CreateParticipation < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.integer :status
      t.timestamps
    end
  end
end
