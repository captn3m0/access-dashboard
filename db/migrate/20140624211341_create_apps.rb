class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.references :service, index: true

      t.timestamps
    end
  end
end
