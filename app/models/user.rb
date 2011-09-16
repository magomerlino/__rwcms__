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

  has_many :worksessions, :foreign_key => :user_oid
  has_and_belongs_to_many :groups, :join_table => :user_group, :foreign_key => :user_oid, 
    :association_foreign_key => :group_oid

  before_validation :set_default

  accessible :username, :email, :firstname, :lastname, :clab_id
  
  def fullname
    [self.firstname, self.lastname].compact.join(" ") unless self.firstname.blank? && self.lastname.blank?
  end

  def is_admin?
    self.groups.admin.size > 0
  end

  def is_evcd_for?(visibility = nil)
    self.groups.evcd.visibility(visibility).size > 0
  end

  def is_rpm_for?(visibility = nil)
    self.groups.rpm.visibility(visibility).size > 0
  end

  def is_lpm_for?(visibility = nil)
    self.groups.lpm.visibility(visibility).size > 0
  end

  def is_lit?
    self.groups.lit.size > 0
  end

  def is_lic?
    self.groups.lic.size > 0
  end

  private
  def set_default
    self.password ||= Digest::SHA1.hexdigest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}")[0..7]
    self.group_id ||= 999
    self.active   ||= true
  end
end