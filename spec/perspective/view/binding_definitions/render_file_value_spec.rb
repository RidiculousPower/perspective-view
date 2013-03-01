# -*- encoding : utf-8 -*-

require_relative '../../../../lib/perspective/view.rb'
require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/binding_definitions/binding_definition_test_setup.rb'

describe ::Perspective::View::BindingDefinitions::RenderFileValue do
  
  let( :file_binding_container ) do
    file_binding_container_class = ::Class.new do
      include ::Perspective::Bindings
      attr_file :file_binding
    end
    file_binding_container_class.name( :FileBindingContainer )
    file_binding_container_class
  end
  
  let( :file_instance ) { ::File.new( «FILE ) }
  
  let( :file_binding ) do
    file_binding = file_binding_container.new.file_binding
    file_binding.extend( ::Perspective::View::BindingDefinitions::RenderFileValue )
    file_binding.«value» = file_instance
    file_binding
  end
  
	####################
	#  «render_value»  #
	####################

	context '#«render_value»' do
	  context 'files by path' do
	    before( :each ) { ::Perspective::Configuration.files.by_path! }
      it 'will return the path of the File instance in «value»' do
        file_binding.«render_value».should == file_binding.«value».to_path
      end
    end
    context 'files by content' do
	    before( :each ) { ::Perspective::Configuration.files.by_content! }
      it 'will return the contents of the File instance in «value»' do
        render_value = file_binding.«render_value»
        file = file_binding.«value»
        file.pos = 0
        render_value.should == file.readlines.join
      end
    end
  end
  
end
