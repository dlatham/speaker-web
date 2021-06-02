class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :mac
      t.string :token
      t.string :internal_ip
      t.string :external_ip
      t.references :user, foreign_key: true
      t.datetime :last_seen_at

      t.timestamps
    end
  end
end
