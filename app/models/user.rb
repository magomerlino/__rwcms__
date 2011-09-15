class User < ActiveRecord::Base
  set_table_name 'user'
  set_primary_key 'oid'
  set_sequence_name 'user_seq'

  alias_attribute :id, :oid
  alias_attribute :group_id, :group_oid
  alias_attribute :clab_id, :clab_oid
  alias_attribute :is_active?, :active

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true
  validates :email, :presence => true, :email => true

  before_validation :set_default

  accessible :username, :email, :firstname, :lastname, :clab_id
  
  def fullname
    [self.firstname, self.lastname].compact.join(" ") unless self.firstname.blank? && self.lastname.blank?
  end

  private
  def set_default
    self.password ||= Digest::SHA1.hexdigest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}")[0..7]
    self.group_id ||= 999
    self.active   ||= true
  end
end