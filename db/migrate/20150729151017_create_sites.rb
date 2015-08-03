class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
