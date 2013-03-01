# -*- encoding : utf-8 -*-

require 'perspective/bindings'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

module ::Perspective::View

  include ::Perspective::Bindings
	include ::Perspective::View::ObjectInstance
  
  extend ::Module::Cluster
  cluster( :perspective ).before_include_or_extend.cascade.extend( ::Perspective::View::SingletonInstance )

end
