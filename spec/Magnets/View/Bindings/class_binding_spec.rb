
require_relative '../../../../lib/magnets-view.rb'

describe ::Magnets::View::Bindings::ClassBinding do

  before :all do
    class ::Magnets::View::Bindings::ClassBinding::Mock
      include ::Magnets::Bindings::Container
    end
    class ::Magnets::View::Bindings::ClassBinding::MockView
      include ::Magnets::Bindings::Container
    end
  end
  
  ####################
  #  view_class      #
  #  __view_class__  #
  ####################
  
  it 'can refer to its container class as a view' do
    ::Magnets::View::Bindings::ClassBinding.instance_method( :__view_class__ ).should == ::Magnets::View::Bindings::ClassBinding.instance_method( :__container_class__ )
    ::Magnets::View::Bindings::ClassBinding.instance_method( :view_class ).should == ::Magnets::View::Bindings::ClassBinding.instance_method( :__view_class__ )
  end

  ##################################
  #  __validate_container_class__  #
  #  __validate_view_class__       #
  ##################################

  it 'adds a method to validate the view class' do
    instance = ::Magnets::Bindings::AttributeContainer::AbstractView::Text.new( ::Magnets::View::Bindings::ClassBinding::Mock, :binding_name )
    
    called_validate_view = false
    instance.define_singleton_method( :__validate_view_class__ ) do |view_class|
      called_validate_view = true
    end
    instance.is_a?( ::Magnets::View::Bindings::ClassBinding ).should == true
    instance.__validate_container_class__( ::Magnets::View::Bindings::ClassBinding::MockView )
    called_validate_view.should == true
  end

end
