
begin ; require 'development' ; rescue ::LoadError ; end

require 'magnets/bindings'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

# post-require setup
require_relative './setup.rb'

module ::Magnets::View

  extend ::Module::Cluster

  include ::Magnets::Bindings

	include ::Magnets::View::ObjectInstance
  
  cascade = cluster( :magnets ).before_include_or_extend.cascade
  cascade.extend( ::Magnets::View::ClassInstance )

end
