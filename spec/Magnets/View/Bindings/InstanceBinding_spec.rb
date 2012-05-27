
require_relative '../../../../lib/magnets-abstract-view.rb'

describe ::Magnets::Abstract::View::Bindings::InstanceBinding do

  ##############
  #  view      #
  #  __view__  #
  ##############
  
  it 'can refer to its container as a view' do
    ::Magnets::Abstract::View::Bindings::InstanceBinding.instance_method( :__view__ ).should == ::Magnets::Abstract::View::Bindings::InstanceBinding.instance_method( :__container__ )
    ::Magnets::Abstract::View::Bindings::InstanceBinding.instance_method( :view ).should == ::Magnets::Abstract::View::Bindings::InstanceBinding.instance_method( :__view__ )
  end

  #########################
  #  render_value_valid?  #
	#  render_value         #
	#  __render_value__     #
  #########################

  it 'can report whether the current value is valid for rendering and return a render value' do
    class_instance = ::Magnets::Bindings::AttributesContainer::AbstractView::Text.new( :binding_name )
    instance = ::Magnets::Bindings::AttributesContainer::AbstractView::Text::InstanceBinding.new( class_instance )
    instance.__value__ = :some_value
    instance.is_a?( ::Magnets::Abstract::View::Attributes::RenderValueAsString ).should == true
    instance.render_value_valid?.should == true
    instance.__render_value__.should == 'some_value'
  end

end
