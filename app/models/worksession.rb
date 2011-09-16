class Worksession < ActiveRecord::Base
  set_table_name 'worksession'
  set_primary_key 'oid'
  set_sequence_name 'worksession_seq'

  alias_attribute :id, :oid
  alias_attribute :user_id, :user_oid
  
  validates :user, :presence => true

  belongs_to :user, :foreign_key => :user_oid
end
