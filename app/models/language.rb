class Language < ActiveRecord::Base
  set_table_name 'language'
  set_primary_key 'isocode2'

  alias_attribute :english_name, :englishname

  has_many :clabs, :foreign_key => :language_isocode2

  after_initialize :prevent_creation

  private
  def prevent_creation
    raise if self.new_record?
  end
end
