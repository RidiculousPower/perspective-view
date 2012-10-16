
require_relative '../../../../lib/perspective/view.rb'

describe ::Perspective::View::Bindings::InstanceBinding do

  before :all do
    class ::Perspective::View::Bindings::InstanceBinding::Mock
      include ::Perspective::Bindings::Container
    end
  end

  ##############
  #  view      #
  #  __view__  #
  ##############
  
  it 'can refer to its container as a view' do
    ::Perspective::View::Bindings::InstanceBinding.instance_method( :__view__ ).should == ::Perspective::View::Bindings::InstanceBinding.instance_method( :__container__ )
    ::Perspective::View::Bindings::InstanceBinding.instance_method( :view ).should == ::Perspective::View::Bindings::InstanceBinding.instance_method( :__view__ )
  end

  #########################
  #  render_value_valid?  #
	#  render_value         #
	#  __render_value__     #
  #########################

  it 'can report whether the current value is valid for rendering and return a render value' do
    class_instance = ::Perspective::Bindings::AttributeContainer::AbstractView::Text.new( ::Perspective::View::Bindings::InstanceBinding::Mock, :binding_name )
    instance = ::Perspective::Bindings::AttributeContainer::AbstractView::Text::InstanceBinding.new( class_instance, ::Perspective::View::Bindings::InstanceBinding::Mock.new )
    instance.__value__ = :some_value
    instance.is_a?( ::Perspective::View::Attributes::RenderValueAsString ).should == true
    instance.render_value_valid?.should == true
    instance.__render_value__.should == 'some_value'
  end

end
