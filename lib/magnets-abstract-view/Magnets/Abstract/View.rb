
module ::Magnets::Abstract::View

  include ::Magnets::Bindings

  extend ::ModuleCluster
  extend ::ModuleCluster::Define::Block::CascadingClass

	include ::Magnets::Abstract::View::ObjectInstance
	include_or_extend_cascades_extends ::Magnets::Abstract::View::ClassInstance
  
end
