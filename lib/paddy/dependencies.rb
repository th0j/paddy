class Object
  # Save a lot of require statements
  def self.const_missing(controller_name)
    require Paddy.to_underscore(controller_name.to_s)
    Object.const_get(controller_name)
  end
end
