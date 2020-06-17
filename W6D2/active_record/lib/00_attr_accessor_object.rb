require "byebug"
class AttrAccessorObject
  def self.my_attr_accessor(*names)
 
    names.each do |single_name|
      define_method(single_name) do
        self.instance_variable_get("@#{single_name}")
      end
      define_method("#{single_name}=") do |val|
        self.instance_variable_set("@#{single_name}", val)
      end
    end
  end
end

