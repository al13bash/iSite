class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :type
      t.string :data
      t.integer :position
      t.belongs_to :site, index: true

      t.timestamps
    end
  end
end
