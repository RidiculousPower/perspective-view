
module ::Magnets::Abstract::View

  extend ::ModuleCluster
  extend ::ModuleCluster::Define::Block::CascadingClass

  include ::Magnets::Bindings

	include ::Magnets::Abstract::View::ObjectInstance

	include_or_extend_cascades_prepend_extends ::Magnets::Abstract::View::ClassInstance

end
