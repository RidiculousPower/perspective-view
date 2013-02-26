
files = [
  
  'view/object_and_instance_binding',
  
  'view/binding_definitions/render_file_value',
  'view/binding_definitions/render_value_as_string',
  'view/binding_definitions/view',
  
  'view/object_and_instance_binding',

  'binding_types/view',

  'binding_types/view_bindings',
  
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
  
]

files.each do |this_file|
  require_relative( this_file + '.rb' )
end
