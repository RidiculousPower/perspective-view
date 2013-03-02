# -*- encoding : utf-8 -*-

module ::Perspective::View::Configuration
  
  ################
  #  attr_order  #
  ################

	def attr_order( *binding_order_array )

    return_value = self

		if binding_order_array.empty?         or 
		   ( binding_order_array.size == 1          and
		     order_array = binding_order_array[ 0 ] and 
		     ::Array === order_array                and
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
	  
	  unless has_binding?( binding_name )
  		raise ::Perspective::Bindings::Exception::NoBindingError.new( self, binding_name )
    end
	  
  end

end
