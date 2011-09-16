class Group < ActiveRecord::Base
  set_table_name 'group'
  set_primary_key 'oid'
  set_sequence_name 'group_seq'
  
  alias_attribute :id, :oid
  alias_attribute :module_id, :module_oid
  alias_attribute :visibility_id, :visibilityoid
  alias_attribute :name, :groupname
  
  validates :groupname, :presence => true
  validates :module_oid, :presence => true

  has_and_belongs_to_many :users, :join_table => :user_group, :foreign_key => :group_oid, 
    :association_foreign_key => :user_oid
  has_and_belongs_to_many :clabs, :join_table => :group_clab, :foreign_key => :group_oid, 
    :association_foreign_key => :clab_oid
  has_many :brands, :through => :clabs, :uniq => true

  scope :admin, where(:groupname => "Admin")
  scope :evcd, where("#{qtn}.groupname LIKE ?", "EVCD%")
  scope :rpm, where("#{qtn}.groupname LIKE ?", "RPM%")
  scope :lpm, where("#{qtn}.groupname LIKE ?", "LPM%")
  scope :lit, where("#{qtn}.groupname LIKE ?", "LIT%")
  scope :lic, where("#{qtn}.groupname LIKE ?", "LIC%")
  scope :visibility, lambda{|visibility| (where("#{qtn}.visibilityoid = ?", visibility)) unless visibility.blank? }
end
