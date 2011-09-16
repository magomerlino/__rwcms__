class CreateWorksessions < ActiveRecord::Migration
  def change
    create_table :worksession, {:primary_key => :oid} do |t|
      t.timestamps
      t.integer :user_oid
    end
    add_index :worksession, :oid
    add_index :worksession, :user_oid
  end
end
