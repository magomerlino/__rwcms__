class String
  def to_b
    return [true, "true", 1, "1", "t", "T", "Y", "y"].include?(self)
  end
end

class Fixnum
  def to_b
    return [1].include?(self)
  end
end

class ActiveRecord::Base        
  attr_accessible

  private
  def mass_assignment_authorizer(role = :default)
    if _my_accessible_attrs == :all  
      self.class.protected_attributes  
    else
      super(role) + (_my_accessible_attrs || [])  
    end  
  end 
end

module ActiveRecord
  class Base
    class_attribute :_my_accessible_attrs, :_my_displayable_attrs
    self._my_accessible_attrs = []
    self._my_displayable_attrs = []

    class << self
      alias :qtn :quoted_table_name

      def accessible(*args)
        self._my_accessible_attrs = args.flatten unless args.blank?
      end

      def display(*args)
        self._my_displayable_attrs = args.flatten unless args.blank?
      end

      def accessible_attrs
        self._my_accessible_attrs
      end
    end

    def inspect
      attributes_as_nice_string = displayable_attrs.collect { |name|
        if has_attribute?(name) || new_record? || respond_to?(name)
          "#{name}: #{attribute_for_inspect(name, !has_attribute?(name))}"
        end
      }.compact.join(", ")
      "#<#{self.class} #{attributes_as_nice_string}>"
    end

    def attribute_for_inspect(attr_name, virtual = false)
      value = virtual ? send(attr_name) : read_attribute(attr_name)
      if value.is_a?(String) && value.length > 50
        "#{value[0..50]}...".inspect
      elsif value.is_a?(Date) || value.is_a?(Time)
        %("#{value.to_s(:db)}")
      else
        value.inspect
      end
    end

    private
    def displayable_attrs
      return self.attribute_names if self._my_displayable_attrs.empty?
      self._my_displayable_attrs
    end
  end
end