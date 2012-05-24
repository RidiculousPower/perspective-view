
# require 'magnets-bindings'
require_relative '../../../bindings/lib/magnets-bindings.rb'

module ::Magnets::Abstract
  module View
    module Bindings
    end
  end
end

basepath = 'magnets-abstract-view/Magnets/Abstract/View'

files = [

  'Bindings/ClassBinding',
  'Bindings/InstanceBinding',
  
  'ObjectInstance',
  'ClassInstance'
  
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )

class ::Magnets::Bindings::ClassBinding
  include ::Magnets::Abstract::View::Bindings::ClassBinding
end

class ::Magnets::Bindings::InstanceBinding
  include ::Magnets::Abstract::View::Bindings::InstanceBinding
end
