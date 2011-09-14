class Brand < ActiveRecord::Base
  set_table_name 'brand'
  set_primary_key 'oid'
  set_sequence_name 'brand_seq'

  alias_attribute :id, :oid

  has_many :clabs, :foreign_key => :brand_oid

  after_initialize :prevent_creation

  private
  def prevent_creation
    raise if self.new_record?
  end
end
