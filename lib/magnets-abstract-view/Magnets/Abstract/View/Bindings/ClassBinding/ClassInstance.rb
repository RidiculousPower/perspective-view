
module ::Magnets::Abstract::View::Bindings::ClassBinding::ClassInstance

  include ::Magnets::Bindings::ClassBinding::Configuration

  #####################
  #  view_class       #
  #  view_class=      #
  #  __view_class__   #
  #  __view_class__=  #
  #####################
  
  alias_method :__view_class__, :__container_class__
  alias_method :__view_class__=, :__container_class__=

  alias_method :view_class, :__view_class__
  alias_method :view_class=, :__view_class__=

end
