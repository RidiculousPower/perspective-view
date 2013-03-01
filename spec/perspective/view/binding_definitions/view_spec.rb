
require_relative '../../../../lib/perspective/view.rb'

require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/binding_definitions/binding_definition_test_setup.rb'
require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/binding_definitions/text.rb'
require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/binding_definitions/number.rb'

describe ::Perspective::View::BindingDefinitions::View do

  setup_binding_definition_tests
  let( :binding_definition_module ) { ::Perspective::View::BindingDefinitions::View }
  
  it_behaves_like :text_container_binding
  it_behaves_like :number_container_binding  

  let( :view_instance_class ) do
    view_instance_class = ::Class.new { include ::Perspective::View }
    view_instance_class.name( :ViewInstanceClass )
    view_instance_class
  end
  
  let( :view_instance ) { view_instance_class.new }

  ##############################
  #  binding_value_valid?  #
  ##############################
  
  context '#binding_value_valid?' do
    context 'when value is a Perspective::View' do
      it( 'will match instances of Classes that have included Perspective::View' ) { should match_types( view_instance ) }
    end
  end
  
end
