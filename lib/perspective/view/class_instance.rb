
module ::Perspective::View::ClassInstance

  ::Perspective::Bindings::Attributes.define_container_type( :abstract_view, true, :bindings ) do

    define_binding_type( :view,     ::Perspective::View::Attributes::View )

    extend_binding_type( :text,     ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :integer,  ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :float,    ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :rational, ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :number,   ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :complex,  ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :regexp,   ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :module,   ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :class,    ::Perspective::View::Attributes::RenderValueAsString )
    extend_binding_type( :file,     ::Perspective::View::Attributes::RenderFileValue )
  
  end
    
  include ::Perspective::Bindings::AttributeContainer::AbstractView

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
  		raise ::Perspective::Bindings::Exception::NoBindingError.new( self, binding_name )
    end
	  
  end

end
