# -*- encoding : utf-8 -*-

module ::Perspective::View::SingletonInstance
  
  include ::Perspective::Bindings::Container::SingletonInstance
  include ::Perspective::BindingTypes::ViewBindings

  include ::Perspective::View::Configuration
  
  ##############
  #  «render»  #
  ##############

  alias_method :«render», :«configure»

  ############
  #  render  #
  ############

  alias_method :render, :«render»

end
