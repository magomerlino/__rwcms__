class Region < ActiveRecord::Base
  set_table_name 'region'
  set_primary_key 'oid'
  set_sequence_name 'region_seq'

  alias_attribute :id, :oid
  alias_attribute :application_id, :application_oid

  has_and_belongs_to_many :countries, :join_table => :country_region, :foreign_key => :region_oid, 
    :association_foreign_key => :country_isocode2
  has_many :clabs, :through => :countries
  belongs_to :application, :foreign_key => :application_oid

  after_initialize :prevent_creation
  
  private
  def prevent_creation
    raise if self.new_record?
  end
end
