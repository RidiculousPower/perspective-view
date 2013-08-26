# -*- encoding : utf-8 -*-

module ::Perspective::View::ObjectAndBindingInstance
  
  include ::Perspective::View::Configuration
  
  extend ::CascadingConfiguration::Array
  extend ::CascadingConfiguration::Setting
    
  ###################################
  #  binding_order_declared_empty?  #
  ###################################
  
  ###
  #
  #
  attr_configuration  :binding_order_declared_empty? => :«binding_order_declared_empty»=
  
  #####################################
  #  «binding_order_declared_empty»=  #
  #####################################

  ###
  #
  #
  
  ###########################################
  #  binding_order_declared_empty? Default  #
  ###########################################
  
  self.«binding_order_declared_empty» = false
  
  ######################
  #  rendering_empty!  #
  ######################
  
  def rendering_empty!
    
    self.«binding_order_declared_empty» = true
    
    return self
    
  end
  
  ######################
  #  rendering_empty?  #
  ######################
  
  def rendering_empty?
    
    return binding_order_declared_empty?
    
  end
  

end
