class CreateAssets < ActiveRecord::Migration

  def change
    create_table :assets do |t|
      t.string :name
      t.string :type_a
      t.integer :site_id
      t.timestamps
    end
  end

end
