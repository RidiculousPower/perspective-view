
require_relative '../../../../lib/perspective/view.rb'

describe ::Perspective::View::Bindings::ClassBinding do

  before :all do
    class ::Perspective::View::Bindings::ClassBinding::Mock
      include ::Perspective::Bindings::Container
    end
    class ::Perspective::View::Bindings::ClassBinding::MockView
      include ::Perspective::Bindings::Container
    end
  end
  
  ####################
  #  view_class      #
  #  __view_class__  #
  ####################
  
  it 'can refer to its container class as a view' do
    ::Perspective::View::Bindings::ClassBinding.instance_method( :__view_class__ ).should == ::Perspective::View::Bindings::ClassBinding.instance_method( :__container_class__ )
    ::Perspective::View::Bindings::ClassBinding.instance_method( :view_class ).should == ::Perspective::View::Bindings::ClassBinding.instance_method( :__view_class__ )
  end

  ##################################
  #  __validate_container_class__  #
  #  __validate_view_class__       #
  ##################################

  it 'adds a method to validate the view class' do
    instance = ::Perspective::Bindings::AttributeContainer::AbstractView::Text.new( ::Perspective::View::Bindings::ClassBinding::Mock, :binding_name )
    
    called_validate_view = false
    instance.define_singleton_method( :__validate_view_class__ ) do |view_class|
      called_validate_view = true
    end
    instance.is_a?( ::Perspective::View::Bindings::ClassBinding ).should == true
    instance.__validate_container_class__( ::Perspective::View::Bindings::ClassBinding::MockView )
    called_validate_view.should == true
  end

end
