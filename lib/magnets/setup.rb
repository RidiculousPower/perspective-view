
module ::Magnets::Bindings::AttributeContainer::AbstractView::ClassBinding
  include ::Magnets::View::Bindings::ClassBinding
end

class ::Magnets::Bindings::ClassBinding
  extend ::Magnets::View::Bindings::ClassBinding::ClassInstance
end

module ::Magnets::Bindings::AttributeContainer::AbstractView::InstanceBinding
  include ::Magnets::View::Bindings::InstanceBinding
end
