class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :type
      t.text :data
      t.integer :position
      t.belongs_to :site, index: true

      t.timestamps
    end
    
    add_index :components, :data, length: 10
  end
end
