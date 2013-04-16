# -*- encoding : utf-8 -*-

module ::Perspective::BindingTypes::ViewBindings::ClassBinding
  
  include ::Perspective::View::ObjectAndBindingInstance
  include ::Perspective::View::SingletonAndClassBindingInstance
  
  ##################
  #  «view_class»  #
  ##################

  alias_method :«view_class», :«container_class»

  ###################
  #  «view_class»=  #
  ###################
  
  alias_method :«view_class»=, :«container_class»=

  ################
  #  view_class  #
  ################

  alias_method :view_class, :«view_class»

  #################
  #  view_class=  #
  #################

  alias_method :view_class=, :«view_class»=
  
  ################################
  #  «validate_container_class»  #
  ################################

  def «validate_container_class»( container_class )
  
    super
  
    «validate_view_class»( container_class )
    
  end

  ###########################
  #  «validate_view_class»  #
  ###########################

  def «validate_view_class»( view_class )
    
    # implementation provided by including class/subclass or later included modules
    
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
