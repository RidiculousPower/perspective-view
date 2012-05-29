
require_relative '../../lib/magnets-abstract-view.rb'

describe ::Magnets::Abstract::View do

  before :all do
    
    class ::Magnets::Abstract::View::Mock
      
      include ::Magnets::Abstract::View
      
      attr_text  :some_text
      attr_text  :some_other_view
      attr_text :some_third_views

#      is_a?( ::Magnets::Abstract::View::ClassInstance ).should == true
 #     ancestors.include?( ::Magnets::Abstract::View::ObjectInstance ).should == true

    end
    
  end

	#########################################
  #  binding_order                        #
  #  __binding_order__                    #
  #  attr_order                           #
  #  __validate_binding_name_for_order__  #
  #  binding_order_declared_empty?        #
  #  __binding_order_declared_empty__?    #
  #  rendering_empty!                     #
  #  rendering_empty?                     #
  #  __render_binding_order__             #
	#########################################

  it 'can order bindings in sequence and render the binding order, returning a stack of rendered "nodes", which can be arbitrarily defined so long as they stack in an array' do
    ::Magnets::Abstract::View.instance_method( :binding_order ).should == ::Magnets::Abstract::View.instance_method( :__binding_order__ )
    ::Magnets::Abstract::View::ObjectInstance.instance_method( :binding_order ).should == ::Magnets::Abstract::View::ObjectInstance.instance_method( :__binding_order__ )

    class ::Magnets::Abstract::View::Mock
      
      __binding_order__.is_a?( ::Array ).should == true

      attr_binding :first_binding, :second_binding

      attr_order :first_binding, :second_binding

      __binding_order__.should == [ :first_binding, :second_binding ]

    end

    Proc.new { ::Magnets::Abstract::View::Mock.attr_order :first_binding, :third_binding }.should raise_error( ::Magnets::Bindings::Exception::NoBindingError )

    class ::Magnets::Abstract::View::Mock

      attr_binding :third_binding

    end

    class ::Magnets::Abstract::View::Mock

      attr_order :first_binding, :third_binding

      __binding_order__.should == [ :first_binding, :third_binding ]

      __binding_order__.insert( 1, :second_binding )

      __binding_order__.should == [ :first_binding, :second_binding, :third_binding ]

      attr_order :third_binding

      __binding_order__.should == [ :third_binding ]

      attr_order :first_binding, :second_binding, :third_binding

      __binding_order__.should == [ :first_binding, :second_binding, :third_binding ]
      
    end
    
    instance = ::Magnets::Abstract::View::Mock.new
    
    instance.rendering_empty?.should == false
    instance.rendering_empty!
    instance.rendering_empty?.should == true
    instance.__binding_order__.should == [ instance.__binding__( :first_binding ),
                                           instance.__binding__( :second_binding ),
                                           instance.__binding__( :third_binding ) ]
    
  end

  ############################################
  #  ensure_binding_render_values_valid      #
  #  __ensure_binding_render_values_valid__  #
  ############################################
  
  it 'can run a check just before render-time to ensure value is valid for rendering' do
    
    class ::Magnets::Abstract::View::Mock
    
      attr_text :some_binding
      attr_required_text :some_required_binding
      
    end
    
    Proc.new { ::Magnets::Abstract::View::Mock.new.__ensure_binding_render_values_valid__ }.should raise_error( ::Magnets::Bindings::Exception::BindingRequired )

    instance = ::Magnets::Abstract::View::Mock.new
    
    instance.some_required_binding = :some_value

    Proc.new { instance.__ensure_binding_render_values_valid__ }.should_not raise_error
    
  end

  it 'can cascade definitions' do

    module ::Magnets::Abstract::View::MockModule
      include ::Magnets::Abstract::View
      attr_binding :some_binding
      attr_text :some_text
      attr_numbers :some_numbers
    end

    class ::Magnets::Abstract::View::MockClass
      include ::Magnets::Abstract::View::MockModule
    end

    module ::Magnets::Abstract::View::MockModule2
      include ::Magnets::Abstract::View::MockModule
    end

    class ::Magnets::Abstract::View::MockClass2
      include ::Magnets::Abstract::View::MockModule2
    end

    ::Magnets::Abstract::View::MockModule.has_binding?( :some_binding ).should == true
    ::Magnets::Abstract::View::MockModule.has_binding?( :some_text ).should == true
    ::Magnets::Abstract::View::MockModule.has_binding?( :some_numbers ).should == true
    
    ::Magnets::Abstract::View::MockClass.has_binding?( :some_binding ).should == true
    ::Magnets::Abstract::View::MockClass.has_binding?( :some_text ).should == true
    ::Magnets::Abstract::View::MockClass.has_binding?( :some_numbers ).should == true

    ::Magnets::Abstract::View::MockModule2.has_binding?( :some_binding ).should == true
    ::Magnets::Abstract::View::MockModule2.has_binding?( :some_text ).should == true
    ::Magnets::Abstract::View::MockModule2.has_binding?( :some_numbers ).should == true

    ::Magnets::Abstract::View::MockClass2.has_binding?( :some_binding ).should == true
    ::Magnets::Abstract::View::MockClass2.has_binding?( :some_text ).should == true
    ::Magnets::Abstract::View::MockClass2.has_binding?( :some_numbers ).should == true
    
  end
  
end

