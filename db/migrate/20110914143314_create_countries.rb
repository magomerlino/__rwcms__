class CreateCountries < ActiveRecord::Migration
  def change
    create_table :country, {:id => false} do |t|
      t.string :isocode2, :null => false, :limit => 2
      t.string :isocode3, :limit => 3
      t.string :name
      t.string :englishname
      t.string :phoneprefix
      t.string :currency, :limit => 25
      t.string :currencysymbol, :limit => 5
    end
    add_index :country, :isocode2, :unique => true
  end
end
