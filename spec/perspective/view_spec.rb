
require_relative '../../lib/perspective/view.rb'

describe ::Perspective::View do

  before :all do
    
    class ::Perspective::View::Mock
      
      include ::Perspective::View
      
      attr_text  :some_text
      attr_text  :some_other_view
      attr_text :some_third_views

      is_a?( ::Perspective::View::SingletonInstance ).should == true
      ancestors.include?( ::Perspective::View::ObjectInstance ).should == true

    end
    
  end

	#########################################
  #  binding_order                        #
  #  __binding_order__                    #
  #  attr_order                           #
  #  __validate_binding_name_for_order__  #
  #  binding_order_declared_empty?        #
  #  __binding_order_declared_empty__?    #
  #  __rendering_empty__!                     #
  #  __rendering_empty__?                     #
  #  __render_binding_order__             #
	#########################################

  it 'can order bindings in sequence and render the binding order, returning a stack of rendered "nodes", which can be arbitrarily defined so long as they stack in an array' do
    ::Perspective::View.instance_method( :binding_order ).should == ::Perspective::View.instance_method( :__binding_order__ )
    ::Perspective::View::ObjectInstance.instance_method( :binding_order ).should == ::Perspective::View::ObjectInstance.instance_method( :__binding_order__ )

    class ::Perspective::View::Mock
      
      __binding_order__.is_a?( ::Array ).should == true

      attr_binding :first_binding, :second_binding

      attr_order :first_binding, :second_binding

      __binding_order__.should == [ :first_binding, :second_binding ]

    end

    Proc.new { ::Perspective::View::Mock.attr_order :first_binding, :third_binding }.should raise_error( ::Perspective::Bindings::Exception::NoBindingError )

    class ::Perspective::View::Mock

      attr_binding :third_binding

    end

    class ::Perspective::View::Mock

      attr_order :first_binding, :third_binding

      __binding_order__.should == [ :first_binding, :third_binding ]

      __binding_order__.insert( 1, :second_binding )

      __binding_order__.should == [ :first_binding, :second_binding, :third_binding ]

      attr_order :third_binding

      __binding_order__.should == [ :third_binding ]

      attr_order :first_binding, :second_binding, :third_binding

      __binding_order__.should == [ :first_binding, :second_binding, :third_binding ]
      
    end
    
    instance = ::Perspective::View::Mock.new
    
    instance.__rendering_empty__?.should == false
    instance.__rendering_empty__!
    instance.__rendering_empty__?.should == true
    instance.__binding_order__.should == [ instance.__binding__( :first_binding ),
                                           instance.__binding__( :second_binding ),
                                           instance.__binding__( :third_binding ) ]
    
  end

  #############################
  #  __render_value_valid__?  #
  #############################
  
  it 'can run a check just before render-time to ensure value is valid for rendering' do
    
    class ::Perspective::View::Mock
    
      attr_text :some_binding
      attr_required_text :some_required_binding

    end
    
    Proc.new { ::Perspective::View::Mock.new.__render_value_valid__?( true ) }.should raise_error( ::Perspective::Bindings::Exception::BindingRequired )

    instance = ::Perspective::View::Mock.new
    
    instance.some_required_binding = :some_value

    Proc.new { instance.__render_value_valid__?( true ) }.should_not raise_error
    
  end

  it 'can cascade definitions' do

    module ::Perspective::View::MockModule
      include ::Perspective::View
      attr_binding :some_binding
      attr_text :some_text
      attr_numbers :some_numbers
    end

    class ::Perspective::View::MockClass
      include ::Perspective::View::MockModule
    end

    module ::Perspective::View::MockModule2
      include ::Perspective::View::MockModule
    end

    class ::Perspective::View::MockClass2
      include ::Perspective::View::MockModule2
    end

    ::Perspective::View::MockModule.__has_binding__?( :some_binding ).should == true
    ::Perspective::View::MockModule.__has_binding__?( :some_text ).should == true
    ::Perspective::View::MockModule.__has_binding__?( :some_numbers ).should == true
    
    ::Perspective::View::MockClass.__has_binding__?( :some_binding ).should == true
    ::Perspective::View::MockClass.__has_binding__?( :some_text ).should == true
    ::Perspective::View::MockClass.__has_binding__?( :some_numbers ).should == true

    ::Perspective::View::MockModule2.__has_binding__?( :some_binding ).should == true
    ::Perspective::View::MockModule2.__has_binding__?( :some_text ).should == true
    ::Perspective::View::MockModule2.__has_binding__?( :some_numbers ).should == true

    ::Perspective::View::MockClass2.__has_binding__?( :some_binding ).should == true
    ::Perspective::View::MockClass2.__has_binding__?( :some_text ).should == true
    ::Perspective::View::MockClass2.__has_binding__?( :some_numbers ).should == true
    
  end
  
end

