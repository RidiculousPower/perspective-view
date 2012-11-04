
basepath = 'view'

files = [
  
  'attributes/render_file_value',
  'attributes/render_value_as_string',
  'attributes/view',
  
  'configuration',
  'object_and_binding_instance',
  
  'bindings/class_binding',
  'bindings/class_binding/class_instance',
  'bindings/instance_binding',  
  'object_instance',
  'class_instance'
  
]

files.each do |this_file|
  require_relative( ::File.join( basepath, this_file ) + '.rb' )
end
