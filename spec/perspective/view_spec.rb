
require_relative '../../lib/perspective/view.rb'

require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/container_and_bindings_spec/container_and_bindings_test_setup.rb'
require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/container_and_bindings_spec/container_and_bindings.rb'

describe ::Perspective::View do

  let( :bindings_module ) { ::Perspective::View }
  setup_container_and_bindings_tests  
  
  it_behaves_like :container_and_bindings

  describe ::Perspective::BindingTypes::ViewBindings::ClassBinding do

    ####################
    #  __view_class__  #
    ####################
    
    context '#__view_class__' do
      it 'is an alias for #__container_class__' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__view_class__ ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__container_class__ )
      end
    end
    
    #####################
    #  __view_class__=  #
    #####################

    context '#__view_class__=' do
      it 'is an alias for #__container_class__=' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__view_class__= ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__container_class__= )
      end
    end

    ################
    #  view_class  #
    ################

    context '#view_class' do
      it 'is an alias for #__view_class__' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :view_class ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__view_class__ )
      end
    end

    #################
    #  view_class=  #
    #################

    context '#view_class=' do
      it 'is an alias for #__view_class__=' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :view_class= ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__view_class__= )
      end
    end

    #############################
    #  __validate_view_class__  #
    #############################

    context '#__validate_view_class__' do
      it 'does nothing, defined by implementing classes' do
        class_instance.a.__validate_view_class__( ::Object )
      end
    end

    ##################################
    #  __validate_container_class__  #
    ##################################

    context '#__validate_container_class__' do
      let( :block_state ) { ::BlockState.new }
      let( :action ) { _block_state = block_state ; _block_state.block = ::Proc.new { |*args| _block_state.block_ran! } }
      let( :instance ) do
        instance = class_instance
        called_validate = false
        instance.a.define_singleton_method( :__validate_view_class__, & action )
        instance
      end
      it 'adds a call to #__validate_view_class__' do
        instance.a.__validate_container_class__( instance.a.__container_class__ )
        block_state.block_ran?.should be true
      end
    end

    ################
    #  __render__  #
    ################

    context '#__render__' do
      it 'is an alias for #__configure__' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__render__ ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__configure__ )
      end
    end

    ############
    #  render  #
    ############

    context '#render' do
      it 'is an alias for #__render__' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :render ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :__render__ )
      end
    end

  end

  describe ::Perspective::BindingTypes::ViewBindings::InstanceBinding do

    ##############
    #  __view__  #
    ##############

    context '#__view__' do
      it 'is an alias for #__container__' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__view__ ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__container__ )
      end
    end

    ###############
    #  __view__=  #
    ###############

    context '#__view__=' do
      it 'is an alias for #__container__=' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__view__= ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__container__= )
      end
    end

    ###########
    #  view   #
    ###########

    context '#view' do
      it 'is an alias for #__view__' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :view ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__view__ )
      end
    end

    ###########
    #  view=  #
    ###########

    context '#view=' do
      it 'is an alias for #__view__=' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :view= ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__view__= )
      end
    end

    ######################
  	#  __render_value__  #
  	######################

    context '#__render_value__' do
      it 'is an alias for #__value__' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__render_value__ ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__value__ )
      end
    end

    ####################################
    #  __required_bindings_present__?  #
    ####################################

    context '#__required_bindings_present__' do
      context 'when ensure_present is false' do
        it 'will return whether all required bindings have values' do
          instance_of_class.a.__required_bindings_present__?.should be true
          instance_of_class.a.b.__required__ = true
          instance_of_class.a.__required_bindings_present__?.should be false
        end
      end
      context 'when ensure_present is true' do
        it 'will raise an exception if all required bindings do not have values' do
          instance_of_class.a.__required_bindings_present__?( true ).should be true
          instance_of_class.a.b.__required__ = true
          ::Proc.new { instance_of_class.a.__required_bindings_present__?( true ) }.should raise_error( ::Perspective::Bindings::Exception::BindingRequired )
        end
      end
    end

    ####################
    #  __view_count__  #
    ####################

    context '#__view_count__' do
      it 'is an alias for #__container_count__' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__view_count__ ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :__container_count__ )
      end
    end

    ######################
    #  rendering_empty!  #
    ######################

    context '#rendering_empty!' do
      it 'declare that required bindings should not be required for the next render' do
        instance_of_class.a.instance_variable_get( :@__view_rendering_empty__ ).should be nil
        instance_of_class.a.rendering_empty!
        instance_of_class.a.instance_variable_get( :@__view_rendering_empty__ ).should be true
      end
    end

    ##########################
    #  __rendering_empty__?  #
    ##########################

    context '#__rendering_empty__?' do
      it 'query whether required bindings should be required for the next render' do
        instance_of_class.a.__rendering_empty__?.should be false
        instance_of_class.a.rendering_empty!
        instance_of_class.a.__rendering_empty__?.should be true
      end    
    end

  end

	##################
  #  ::attr_order  #
  ##################

  context '::attr_order' do
    context 'when no binding_order exists' do
      it 'will set order to empty if no parameters' do
        class_instance.attr_order
        class_instance.__binding_order__.should == [ ]
      end
      it 'will set order to parameters if parameters are present' do
        class_instance.attr_order :a, :binding_one, :binding_two
        class_instance.__binding_order__.should == [ :a, :binding_one, :binding_two ]
      end
    end
    context 'when binding_order exists' do
      it 'will reset the binding order' do
        class_instance.attr_order :a, :binding_one, :binding_two
        class_instance.__binding_order__.should == [ :a, :binding_one, :binding_two ]
        class_instance.attr_order
        class_instance.__binding_order__.should == [ ]
      end
    end
  end

	###########################################
  #  ::__validate_binding_name_for_order__  #
	###########################################

  context '::__validate_binding_name_for_order__' do
    it 'ensures that binding exists for name' do
      class_instance.__validate_binding_name_for_order__( :a )
      ::Proc.new { class_instance.__validate_binding_name_for_order__( :b ) }.should raise_error( ::Perspective::Bindings::Exception::NoBindingError )
    end
  end

  ##################
  #  ::__render__  #
  ##################

  context '::__render__' do
    it 'is an alias for ::__configure__' do
      ::Perspective::View::SingletonInstance.instance_method( :__render__ ).should == ::Perspective::View::SingletonInstance.instance_method( :__configure__ )
    end
  end

  ##############
  #  ::render  #
  ##############

  context '::render' do
    it 'is an alias for ::__render__' do
      ::Perspective::View::SingletonInstance.instance_method( :render ).should == ::Perspective::View::SingletonInstance.instance_method( :__render__ )
    end
  end

  #########################
  #  ::__binding_order__  #
  #########################

  context '::__binding_order__' do
    it 'returns the binding order as set through ::attr_order; permits modification' do
      class_instance.attr_order :a, :binding_one, :binding_two
      class_instance.__binding_order__.should == [ :a, :binding_one, :binding_two ]
    end
  end

  #######################
  #  __binding_order__  #
  #######################

  context '#__binding_order__' do
    it 'returns the binding order with instances corresponding to ::__binding_order__; permits modification' do
      class_instance.attr_order :a, :binding_one, :binding_two
      instance_of_class.__binding_order__.should == [ instance_of_class.a, instance_of_class.binding_one, instance_of_class.binding_two ]
    end
  end

  ###################
  #  binding_order  #
  ###################

  context '#binding_order' do
    it 'is an alias for ::__binding_order__' do
      ::Perspective::View::ObjectInstance.instance_method( :binding_order ).should == ::Perspective::View::ObjectInstance.instance_method( :__binding_order__ )
    end
  end

  ######################
  #  rendering_empty!  #
  ######################

  context '#rendering_empty!' do
    it 'declare that required bindings should not be required for the next render' do
      instance_of_class.binding_order_declared_empty?.should be false
      instance_of_class.rendering_empty!
      instance_of_class.binding_order_declared_empty?.should be true
    end
  end

  ##########################
  #  __rendering_empty__?  #
  ##########################

  context '#__rendering_empty__?' do
    it 'query whether required bindings should be required for the next render' do
      instance_of_class.__rendering_empty__?.should be false
      instance_of_class.rendering_empty!
      instance_of_class.__rendering_empty__?.should be true
    end    
  end

  ###################################
  #  binding_order_declared_empty?  #
  ###################################

  context '#binding_order_declared_empty?' do
    it 'reports whether required bindings should be validated' do
      instance_of_class.binding_order_declared_empty?.should be false
    end
  end

  #######################################
  #  __binding_order_declared_empty__=  #
  #######################################

  context '#__binding_order_declared_empty__=' do
    it 'set whether required bindings should be validated (if declared empty, they will not be required)' do
      instance_of_class.rendering_empty!
      instance_of_class.binding_order_declared_empty?.should be true
    end
  end

  ####################################
  #  __required_bindings_present__?  #
  ####################################

  context '#__required_bindings_present__?' do
    context 'when ensure_present is false' do
      it 'will return whether all required bindings have values' do
        instance_of_class.__required_bindings_present__?.should be true
        instance_of_class.a.__required__ = true
        instance_of_class.__required_bindings_present__?.should be false
      end
    end
    context 'when ensure_present is true' do
      it 'will raise an exception if all required bindings do not have values' do
        instance_of_class.__required_bindings_present__?( true ).should be true
        instance_of_class.a.__required__ = true
        ::Proc.new { instance_of_class.__required_bindings_present__?( true ) }.should raise_error( ::Perspective::Bindings::Exception::BindingRequired )
      end
    end
  end

	##############################
  #  __render_binding_order__  #
  ##############################

  context '#__render_binding_order__' do
    it 'compiles a list of render values corresponding to each binding; intended for more advanced rendering implemented by later binding/container types' do
      class_instance.attr_order :binding_one, :binding_two, :content
      instance_of_class.binding_one.value = :binding_one_value
      instance_of_class.binding_two.value = :binding_two_value
      instance_of_class.content.value = :content_value
      instance_of_class.a.b.c.content.value = :c_content_value
      instance_of_class.__render_binding_order__.should == [:binding_one_value, :binding_two_value, :content_value]
    end
  end

end

