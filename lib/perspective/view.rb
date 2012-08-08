
begin ; require 'development' ; rescue ::LoadError ; end

require 'perspective/bindings'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

# post-require setup
require_relative './setup.rb'

module ::Perspective::View

  extend ::Module::Cluster

  include ::Perspective::Bindings

	include ::Perspective::View::ObjectInstance
  
  cascade = cluster( :perspective ).before_include_or_extend.cascade
  cascade.extend( ::Perspective::View::ClassInstance )

end
