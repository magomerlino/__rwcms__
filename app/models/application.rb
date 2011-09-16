class Application < ActiveRecord::Base
  set_table_name 'application'
  set_primary_key 'oid'
  set_sequence_name 'application_seq'

  alias_attribute :id, :oid

  delegate :label, :to => :statusObj, :allow_nil => true, :prefix => :status

  has_many :clabs, :foreign_key => :application_oid
  belongs_to :statusObj, :foreign_key => :status, :class_name => 'Status'

  after_initialize :prevent_creation

  private
  def prevent_creation
    raise if self.new_record?
  end
end
