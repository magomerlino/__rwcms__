class Group < ActiveRecord::Base
  set_table_name 'group'
  set_primary_key 'oid'
  set_sequence_name 'group_seq'
  
  alias_attribute :id, :oid
  alias_attribute :module_id, :module_oid
  alias_attribute :visibility_oid, :visibilityoid
  
  validates :groupname, :presence => true
  validates :module_oid, :presence => true
   
  
end
