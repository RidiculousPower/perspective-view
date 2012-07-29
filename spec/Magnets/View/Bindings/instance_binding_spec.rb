
require_relative '../../../../lib/magnets-view.rb'

describe ::Magnets::View::Bindings::InstanceBinding do

  before :all do
    class ::Magnets::View::Bindings::InstanceBinding::Mock
      include ::Magnets::Bindings::Container
    end
  end

  ##############
  #  view      #
  #  __view__  #
  ##############
  
  it 'can refer to its container as a view' do
    ::Magnets::View::Bindings::InstanceBinding.instance_method( :__view__ ).should == ::Magnets::View::Bindings::InstanceBinding.instance_method( :__container__ )
    ::Magnets::View::Bindings::InstanceBinding.instance_method( :view ).should == ::Magnets::View::Bindings::InstanceBinding.instance_method( :__view__ )
  end

  #########################
  #  render_value_valid?  #
	#  render_value         #
	#  __render_value__     #
  #########################

  it 'can report whether the current value is valid for rendering and return a render value' do
    class_instance = ::Magnets::Bindings::AttributeContainer::AbstractView::Text.new( ::Magnets::View::Bindings::InstanceBinding::Mock, :binding_name )
    instance = ::Magnets::Bindings::AttributeContainer::AbstractView::Text::InstanceBinding.new( class_instance, Object.new )
    instance.__value__ = :some_value
    instance.is_a?( ::Magnets::View::Attributes::RenderValueAsString ).should == true
    instance.render_value_valid?.should == true
    instance.__render_value__.should == 'some_value'
  end

end
