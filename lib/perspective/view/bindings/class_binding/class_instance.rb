
module ::Perspective::View::Bindings::ClassBinding::ClassInstance

  include ::Perspective::Bindings::ClassBinding::ClassInstance

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
