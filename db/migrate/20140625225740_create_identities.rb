class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid
      t.references :service, index: true

      t.timestamps
    end
  end
end
