# -*- encoding : utf-8 -*-

module ::Perspective::View::InstanceBindings::RenderValueAsString

	####################
	#  «render_value»  #
	####################
	
	def «render_value»( current_value = «value» )
	  
    return current_value.to_s
    
  end

end
