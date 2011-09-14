class Country < ActiveRecord::Base
  set_table_name 'country'
  set_primary_key 'isocode2'

  alias_attribute :english_name, :englishname
  alias_attribute :phone_prefix, :phoneprefix
  alias_attribute :currency_symbol, :currencysymbol

  has_many :clabs, :foreign_key => :country_isocode2

  after_initialize :prevent_creation

  def is_master?
    self.isocode2 == 'WW'
  end

  private
  def prevent_creation
    raise if self.new_record?
  end
end
