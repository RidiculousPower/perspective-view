# -*- encoding : utf-8 -*-

module ::Perspective::View::SingletonInstance
  
  include ::Perspective::Bindings::Container::SingletonInstance
  include ::Perspective::BindingTypes::ViewBindings
  
	################
  #  attr_order  #
  ################

	def attr_order( *binding_order_array )

    return_value = self

		if binding_order_array.empty?         or 
		   ( binding_order_array.count == 1            and 
		     binding_order_array[ 0 ].is_a?( ::Array ) and
		     binding_order_array[ 0 ].empty? )
		
      self.«binding_order_declared_empty» = true
		  «binding_order».clear
		  
		else

      self.«binding_order_declared_empty» = false

	  	binding_order_array.each do |this_binding_name|
	  	  
	  	  «validate_binding_name_for_order»( this_binding_name )
	  	  
			end

			«binding_order».replace( binding_order_array )
			
		end
		
		return return_value

	end

  ####################################
  #  ensure_binding_order_declared!  #
  ####################################
  
  def ensure_binding_order_declared!

    if ! binding_order_declared_empty? and «binding_order».empty?
      raise ::Perspective::Bindings::Exception::BindingOrderEmpty,
              'Binding order was empty. Declare binding order using :attr_order.'
    end
    
  end

	#######################################
  #  «validate_binding_name_for_order»  #
	#######################################
	
	def «validate_binding_name_for_order»( binding_name )
	  
	  unless has_binding?( binding_name )
  		raise ::Perspective::Bindings::Exception::NoBindingError.new( self, binding_name )
    end
	  
  end

  ##############
  #  «render»  #
  ##############

  alias_method :«render», :«configure»

  ############
  #  render  #
  ############

  alias_method :render, :«render»

end
