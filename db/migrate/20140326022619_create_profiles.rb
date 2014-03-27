class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :gender
      t.string :religion
      t.datetime :birthday
      t.string :current
      t.string :hometown
      t.string :education
      t.string :employment
      t.string :website

      t.timestamps
    end
  end
end
