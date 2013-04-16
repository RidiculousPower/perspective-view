# -*- encoding : utf-8 -*-

module ::Perspective::View::Configuration
  
  ################
  #  attr_order  #
  ################

	def attr_order( *binding_order_array )

    return_value = self

    # no args or empty array both declare empty
		if binding_order_array.empty?         or 
		   ( binding_order_array.size == 1                          and
		     ::Array === ( order_array = binding_order_array[ 0 ] ) and 
		     order_array.empty? )
		
      self.«binding_order_declared_empty» = true
		  «binding_order».clear
		  
		else

      self.«binding_order_declared_empty» = false
	  	binding_order_array.each { |this_binding_name| «validate_binding_name_for_order»( this_binding_name ) }
			«binding_order».replace( binding_order_array )
			
		end

		return return_value

	end

	#######################################
  #  «validate_binding_name_for_order»  #
	#######################################
	
	def «validate_binding_name_for_order»( binding_name )
	  
	  case binding_name
      when ::Symbol, ::String
    	  unless has_binding?( binding_name )
      		raise ::Perspective::Bindings::Exception::NoBindingError.new( self, binding_name )
        end
      when ::Perspective::Bindings::ClassBinding, ::Perspective::Bindings::InstanceBinding
        unless binding_name.«bound_container».equal?( self )
          raise ::ArgumentError, 'Binding order can only accept bindings from the container ' <<
                'for which the order is being declared.'
        end
      else
        raise ::ArgumentError, 'Unknown argument for binding order ' << binding_name.to_s << '.'
    end
    
    
	  
  end

end
