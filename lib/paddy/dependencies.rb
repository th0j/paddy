class Object
  # Save a lot of require statements
  def self.const_missing(controller_name)
    return nil if @calling_const_missing

    @calling_const_missing = true
    require Paddy.to_underscore(controller_name.to_s)
    klass = Object.const_get(controller_name)
    @calling_const_missing = false

    klass
  end
end
