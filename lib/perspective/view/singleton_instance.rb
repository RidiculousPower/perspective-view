
module ::Perspective::View::SingletonInstance
    
	################
  #  attr_order  #
  ################

	def attr_order( *binding_order_array )

    return_value = self

		if binding_order_array.empty?         or 
		   ( binding_order_array.count == 1            and 
		     binding_order_array[ 0 ].is_a?( ::Array ) and
		     binding_order_array[ 0 ].empty? )
		
      self.__binding_order_declared_empty__ = true
		
		else

      self.__binding_order_declared_empty__ = false

	  	binding_order_array.each do |this_binding_name|
	  	  
	  	  __validate_binding_name_for_order__( this_binding_name )
	  	  
			end

			__binding_order__.replace( binding_order_array )
			
		end
		
		return return_value

	end

	#########################################
  #  __validate_binding_name_for_order__  #
	#########################################
	
	def __validate_binding_name_for_order__( binding_name )
	  
	  unless __has_binding__?( binding_name )
  		raise ::Perspective::Bindings::Exception::NoBindingError.new( self, binding_name )
    end
	  
  end

  ################
  #  __render__  #
  ################

  alias_method :__render__, :__configure__

  ############
  #  render  #
  ############

  alias_method :render, :__render__

end
