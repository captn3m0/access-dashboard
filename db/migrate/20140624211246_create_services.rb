class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :logo_url
      t.boolean :is_dynamic

      t.timestamps
    end
  end
end
