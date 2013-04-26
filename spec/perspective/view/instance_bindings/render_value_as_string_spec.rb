# -*- encoding : utf-8 -*-

require_relative '../../../../lib/perspective/view.rb'
require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/instance_bindings/binding_definition_test_setup.rb'

describe ::Perspective::View::InstanceBindings::RenderValueAsString do

  let( :string_binding_container ) do
    string_binding_container_class = ::Class.new do
      include ::Perspective::Bindings
      attr_binding :object_binding
    end
    string_binding_container_class.name( :StringBindingContainer )
    string_binding_container_class
  end
  
  let( :string_binding_container_instance ) { string_binding_container.new }

  let( :object_instance ) { :symbol_value }
  
  let( :binding_instance ) do
    binding_instance = string_binding_container_instance.•object_binding
    binding_instance.extend( ::Perspective::View::InstanceBindings::RenderValueAsString )
    binding_instance.«value» = object_instance
    binding_instance
  end
  
  ####################
	#  «render_value»  #
	####################

	context '#«render_value»' do
	  it 'will return «value» as a string' do
	    binding_instance.«render_value».should == binding_instance.«value».to_s
    end
  end
  
end
