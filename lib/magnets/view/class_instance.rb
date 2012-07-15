
module ::Magnets::View::ClassInstance

  include ::Magnets::View::Configuration
    
  ::Magnets::Bindings::Attributes.define_container_type( :abstract_view, true, :bindings ) do

    define_binding_type( :view,     ::Magnets::View::Attributes::View )

    extend_binding_type( :text,     ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :integer,  ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :float,    ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :rational, ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :number,   ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :complex,  ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :regexp,   ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :module,   ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :class,    ::Magnets::View::Attributes::RenderValueAsString )
    extend_binding_type( :file,     ::Magnets::View::Attributes::RenderFileValue )
  
  end
    
  include ::Magnets::Bindings::AttributeContainer::AbstractView

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
	  
	  unless has_binding?( binding_name )
  		raise ::Magnets::Bindings::Exception::NoBindingError.new( self, binding_name )
    end
	  
  end

end
