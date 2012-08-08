
module ::Perspective::Bindings::AttributeContainer::AbstractView::ClassBinding
  include ::Perspective::View::Bindings::ClassBinding
end

class ::Perspective::Bindings::ClassBinding
  extend ::Perspective::View::Bindings::ClassBinding::ClassInstance
end

module ::Perspective::Bindings::AttributeContainer::AbstractView::InstanceBinding
  include ::Perspective::View::Bindings::InstanceBinding
end
