
module ::Perspective::Bindings::BindingTypeContainer::AbstractView::ClassBinding
  include ::Perspective::View::Bindings::BindingBase::ClassBinding
end

class ::Perspective::Bindings::BindingBase::ClassBinding
  extend ::Perspective::View::Bindings::BindingBase::ClassBinding::SingletonInstance
end

module ::Perspective::Bindings::BindingTypeContainer::AbstractView::InstanceBinding
  include ::Perspective::View::Bindings::BindingBase::InstanceBinding
end
