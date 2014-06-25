class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :service, index: true
      t.integer :external_id
      t.string :username
      t.string :avatar_url

      t.timestamps
    end
  end
end
