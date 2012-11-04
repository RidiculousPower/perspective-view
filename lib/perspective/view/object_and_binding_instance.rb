
module ::Perspective::View::ObjectAndBindingInstance

  ##########################
  #  __rendering_empty__!  #
  ##########################
  
  def __rendering_empty__!
    
    @__view_rendering_empty__ = true
    
  end
  
  ##########################
  #  __rendering_empty__?  #
  ##########################
  
  def __rendering_empty__?
    
    return @__view_rendering_empty__ ||= false
    
  end
  
end
