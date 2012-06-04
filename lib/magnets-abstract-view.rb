
# require 'magnets-bindings'
require_relative '../../../bindings/lib/magnets-bindings.rb'

module ::Magnets::Abstract
  module View
    module Attributes
    end
    module Bindings
    end
  end
end

basepath = 'magnets-abstract-view/Magnets/Abstract/View'

files = [
  
  'Attributes/RenderFileValue',
  'Attributes/RenderValueAsString',
  'Attributes/View',
  
  'Configuration',
  
  'Bindings/ClassBinding',
  'Bindings/InstanceBinding',  
  'ObjectInstance',
  'ClassInstance'
  
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )

module ::Magnets::Bindings::AttributeContainer::AbstractView::ClassBinding
  include Magnets::Abstract::View::Bindings::ClassBinding
end

module ::Magnets::Bindings::AttributeContainer::AbstractView::InstanceBinding
  include Magnets::Abstract::View::Bindings::InstanceBinding
end
