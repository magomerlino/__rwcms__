class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :language, {:id => false} do |t|
      t.string :isocode2, :null => false, :limit => 2
      t.string :isocode3, :limit => 3
      t.string :name
      t.string :englishname
    end
    add_index :language, :isocode2, :unique => true
  end
end
