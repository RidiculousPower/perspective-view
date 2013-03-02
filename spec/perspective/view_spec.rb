# -*- encoding : utf-8 -*-

require_relative '../../lib/perspective/view.rb'

require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/container_and_bindings_spec/container_and_bindings_test_setup.rb'
require_relative ::File.join ::Perspective::Bindings.spec_location, 'perspective/bindings/container_and_bindings_spec/container_and_bindings.rb'

describe ::Perspective::View do

  let( :bindings_module ) { ::Perspective::View }
  setup_container_and_bindings_tests  
  
  it_behaves_like :container_and_bindings

  describe ::Perspective::BindingTypes::ViewBindings::ClassBinding do

    ##################
    #  «view_class»  #
    ##################
    
    context '#«view_class»' do
      it 'is an alias for #«container_class»' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«view_class» ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«container_class» )
      end
    end
    
    ###################
    #  «view_class»=  #
    ###################

    context '#«view_class»=' do
      it 'is an alias for #«container_class»=' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«view_class»= ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«container_class»= )
      end
    end

    ################
    #  view_class  #
    ################

    context '#view_class' do
      it 'is an alias for #«view_class»' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :view_class ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«view_class» )
      end
    end

    #################
    #  view_class=  #
    #################

    context '#view_class=' do
      it 'is an alias for #«view_class»=' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :view_class= ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«view_class»= )
      end
    end

    ###########################
    #  «validate_view_class»  #
    ###########################

    context '#«validate_view_class»' do
      it 'does nothing, defined by implementing classes' do
        class_instance.a.«validate_view_class»( ::Object )
      end
    end

    ################################
    #  «validate_container_class»  #
    ################################

    context '#«validate_container_class»' do
      let( :block_state ) { ::BlockState.new }
      let( :action ) { _block_state = block_state ; _block_state.block = ::Proc.new { |*args| _block_state.block_ran! } }
      let( :instance ) do
        instance = class_instance
        called_validate = false
        instance.a.define_singleton_method( :«validate_view_class», & action )
        instance
      end
      it 'adds a call to #«validate_view_class»' do
        instance.a.«validate_container_class»( instance.a.«container_class» )
        block_state.block_ran?.should be true
      end
    end

    ##############
    #  «render»  #
    ##############

    context '#«render»' do
      it 'is an alias for #«configure»' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«render» ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«configure» )
      end
    end

    ############
    #  render  #
    ############

    context '#render' do
      it 'is an alias for #«render»' do
        ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :render ).should == ::Perspective::BindingTypes::ViewBindings::ClassBinding.instance_method( :«render» )
      end
    end

  end

  describe ::Perspective::BindingTypes::ViewBindings::InstanceBinding do

    ############
    #  «view»  #
    ############

    context '#«view»' do
      it 'is an alias for #«container»' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«view» ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«container» )
      end
    end

    #############
    #  «view»=  #
    #############

    context '#«view»=' do
      it 'is an alias for #«container»=' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«view»= ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«container»= )
      end
    end

    ###########
    #  view   #
    ###########

    context '#view' do
      it 'is an alias for #«view»' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :view ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«view» )
      end
    end

    ###########
    #  view=  #
    ###########

    context '#view=' do
      it 'is an alias for #«view»=' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :view= ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«view»= )
      end
    end

    ####################
  	#  «render_value»  #
  	####################

    context '#«render_value»' do
      it 'returns #«value».to_s' do
        instance_of_class.content = :content_value
        instance_of_class.•content.«render_value».should == instance_of_class.content.to_s
      end
    end

    ################################
    #  required_bindings_present?  #
    ################################

    context '#«required_bindings_present»' do
      it 'will return whether all required bindings have values' do
        instance_of_class.a.required_bindings_present?.should be true
        instance_of_class.a.b.required = true
        instance_of_class.a.required_bindings_present?.should be false
      end
    end

    #######################################
    #  ensure_required_bindings_present!  #
    #######################################
    
    context '#ensure_required_bindings_present!' do
      it 'will raise an exception if all required bindings do not have values' do
        instance_of_class.a.b.required = true
        ::Proc.new { instance_of_class.a.ensure_required_bindings_present! }.should raise_error( ::Perspective::Bindings::Exception::BindingRequired )
      end
    end
    
    ##################
    #  «view_count»  #
    ##################

    context '#«view_count»' do
      it 'is an alias for #«container_count»' do
        ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«view_count» ).should == ::Perspective::BindingTypes::ViewBindings::InstanceBinding.instance_method( :«container_count» )
      end
    end

    ######################
    #  rendering_empty!  #
    ######################

    context '#rendering_empty!' do
      it 'declare that required bindings should not be required for the next render' do
        instance_of_class.a.instance_variable_get( :@«view_rendering_empty» ).should be nil
        instance_of_class.a.rendering_empty!
        instance_of_class.a.instance_variable_get( :@«view_rendering_empty» ).should be true
      end
    end

    ######################
    #  rendering_empty?  #
    ######################

    context '#rendering_empty?' do
      it 'query whether required bindings should be required for the next render' do
        instance_of_class.a.rendering_empty?.should be false
        instance_of_class.a.rendering_empty!
        instance_of_class.a.rendering_empty?.should be true
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
        class_instance.«binding_order».should == [ ]
      end
      it 'will set order to parameters if parameters are present' do
        class_instance.attr_order :a, :binding_one, :binding_two
        class_instance.«binding_order».should == [ :a, :binding_one, :binding_two ]
      end
    end
    context 'when binding_order exists' do
      it 'will reset the binding order' do
        class_instance.attr_order :a, :binding_one, :binding_two
        class_instance.«binding_order».should == [ :a, :binding_one, :binding_two ]
        class_instance.attr_order
        class_instance.«binding_order».should == [ ]
      end
    end
  end

	#########################################
  #  ::«validate_binding_name_for_order»  #
	#########################################

  context '::«validate_binding_name_for_order»' do
    it 'ensures that binding exists for name' do
      class_instance.«validate_binding_name_for_order»( :a )
      ::Proc.new { class_instance.«validate_binding_name_for_order»( :b ) }.should raise_error( ::Perspective::Bindings::Exception::NoBindingError )
    end
  end

  ################
  #  ::«render»  #
  ################

  context '::«render»' do
    it 'is an alias for ::«configure»' do
      ::Perspective::View::SingletonInstance.instance_method( :«render» ).should == ::Perspective::View::SingletonInstance.instance_method( :«configure» )
    end
  end

  ##############
  #  ::render  #
  ##############

  context '::render' do
    it 'is an alias for ::«render»' do
      ::Perspective::View::SingletonInstance.instance_method( :render ).should == ::Perspective::View::SingletonInstance.instance_method( :«render» )
    end
  end

  #######################
  #  ::«binding_order»  #
  #######################

  context '::«binding_order»' do
    it 'returns the binding order as set through ::attr_order; permits modification' do
      class_instance.attr_order :a, :binding_one, :binding_two
      class_instance.«binding_order».should == [ :a, :binding_one, :binding_two ]
    end
  end

  #####################
  #  «binding_order»  #
  #####################

  context '#«binding_order»' do
    it 'returns the binding order with instances corresponding to ::«binding_order»; permits modification' do
      class_instance.attr_order :a, :binding_one, :binding_two
      instance_of_class.«binding_order».should == [ instance_of_class.•a, instance_of_class.•binding_one, instance_of_class.•binding_two ]
    end
  end

  ###################
  #  binding_order  #
  ###################

  context '#binding_order' do
    it 'is an alias for ::«binding_order»' do
      ::Perspective::View::ObjectInstance.instance_method( :binding_order ).should == ::Perspective::View::ObjectInstance.instance_method( :«binding_order» )
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

  ######################
  #  rendering_empty?  #
  ######################

  context '#rendering_empty?' do
    it 'query whether required bindings should be required for the next render' do
      instance_of_class.rendering_empty?.should be false
      instance_of_class.rendering_empty!
      instance_of_class.rendering_empty?.should be true
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

  #####################################
  #  «binding_order_declared_empty»=  #
  #####################################

  context '#«binding_order_declared_empty»=' do
    it 'set whether required bindings should be validated (if declared empty, they will not be required)' do
      instance_of_class.rendering_empty!
      instance_of_class.binding_order_declared_empty?.should be true
    end
  end

  ################################
  #  required_bindings_present?  #
  ################################

  context '#required_bindings_present?' do
    it 'will return whether all required bindings have values' do
      instance_of_class.required_bindings_present?.should be true
      instance_of_class.a.required = true
      instance_of_class.required_bindings_present?.should be false
    end
  end

  #######################################
  #  ensure_required_bindings_present!  #
  #######################################

  context 'ensure_required_bindings_present!' do
    it 'will raise an exception if all required bindings do not have values' do
      instance_of_class.a.required = true
      ::Proc.new { instance_of_class.ensure_required_bindings_present! }.should raise_error( ::Perspective::Bindings::Exception::BindingRequired )
    end
  end

	############################
  #  «render_binding_order»  #
  ############################

  context '#«render_binding_order»' do
    it 'compiles a list of render values corresponding to each binding; intended for more advanced rendering implemented by later binding/container types' do
      class_instance.attr_order :binding_one, :binding_two, :content
      instance_of_class.binding_one = :binding_one_value
      instance_of_class.binding_two = :binding_two_value
      instance_of_class.content = :content_value
      instance_of_class.a.b.c.content = :c_content_value
      instance_of_class.«render_binding_order».should == [ 'binding_one_value', 'binding_two_value', 'content_value' ]
    end
  end

end

