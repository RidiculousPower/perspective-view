# -*- encoding : utf-8 -*-

[
    
  'view/instance_bindings/render_file_value',
  'view/instance_bindings/render_value_as_string',
  'view/instance_bindings/view',
  
  'binding_types/view',

  'binding_types/view_bindings',

  'view/configuration',
  'view/object_and_binding_instance',
  'view/object_and_instance_binding_instance',
  'view/singleton_and_class_binding_instance',
  
  'binding_types/view_bindings/class_binding',
  'binding_types/view_bindings/instance_binding',  

  'binding_types/view_bindings/class/instance_binding',  
  'binding_types/view_bindings/complex/instance_binding',  
  'binding_types/view_bindings/file/instance_binding',  
  'binding_types/view_bindings/float/instance_binding',  
  'binding_types/view_bindings/integer/instance_binding',  
  'binding_types/view_bindings/module/instance_binding',  
  'binding_types/view_bindings/number/instance_binding',  
  'binding_types/view_bindings/rational/instance_binding',  
  'binding_types/view_bindings/regexp/instance_binding',  
  'binding_types/view_bindings/text/instance_binding',  
  'binding_types/view_bindings/view/instance_binding',  

  'view/object_instance',
  'view/singleton_instance'
  
].each { |this_file| require_relative( this_file << '.rb' ) }
