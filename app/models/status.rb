class Status < ActiveRecord::Base
  set_table_name 'status'
  set_primary_key 'oid'
  set_sequence_name 'status_seq'

  after_initialize :prevent_creation

  private
  def prevent_creation
    raise if self.new_record?
  end
end
