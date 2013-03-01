# -*- encoding : utf-8 -*-

module ::Perspective::View::BindingDefinitions::View

  include ::Perspective::Bindings::BindingDefinitions::Text
  include ::Perspective::Bindings::BindingDefinitions::Number

  ##############################
  #  binding_value_valid?  #
  ##############################

  def binding_value_valid?( binding_value )
    
    binding_value_valid = false
    
    case binding_value
      when ::Perspective::View
        binding_value_valid = true
      else
        binding_value_valid = super if defined?( super )
    end
    
    return binding_value_valid
    
  end
  
end
