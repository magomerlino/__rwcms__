class Clab < ActiveRecord::Base
  set_table_name 'clab'
  set_primary_key 'oid'
  set_sequence_name 'clab_seq'

  alias_attribute :id, :oid
  alias_attribute :brand_id, :brand_oid
  alias_attribute :application_id, :application_oid
  alias_attribute :application_name, :applicationname
  alias_attribute :basic_url, :basicurl

  validates :status, :presence => true
  validates :label, :presence => true
  validates :brand, :presence => true
  validates :application_id, :presence => true
  validates :country, :presence => true
  validates :language, :presence => true

  belongs_to :country, :foreign_key => :country_isocode2
  belongs_to :language, :foreign_key => :language_isocode2
  belongs_to :brand, :foreign_key => :brand_oid

  before_validation :set_default

  accessible :label, :brand_id, :brand, :country_isocode2, :country, :language_isocode2, 
    :language, :basic_url, :application_name

  def is_master?
    country_isocode2 == 'WW'
  end
  
  private
  def set_default
    self.status         ||= 1
    self.application_id ||= 5
  end
end
