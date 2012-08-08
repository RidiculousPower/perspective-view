
module ::Perspective::View::Attributes::View

  include ::Perspective::Bindings::Attributes::Text
  include ::Perspective::Bindings::Attributes::Number

  ##########################
  #  binding_value_valid?  #
  ##########################

  def binding_value_valid?( binding_value )
    
    binding_value_valid = false
    
    if binding_value.is_a?( ::Perspective::View )
      
      binding_value_valid = true
      
    elsif defined?( super )
      
      binding_value_valid = super
      
    end
    
    return binding_value_valid
    
  end
  
end
