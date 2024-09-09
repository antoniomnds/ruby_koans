# The path to Ruby Enlightenment starts with the following:

$LOAD_PATH << File.dirname(__FILE__)

require 'about_asserts' # done
require 'about_true_and_false' # done
require 'about_strings' # required and done
require 'about_symbols' # required and done
require 'about_arrays' # required and done
require 'about_array_assignment' # done
require 'about_objects' # done
require 'about_nil' # done
require 'about_hashes' # required and done
require 'about_methods' # required and done
in_ruby_version('2', '3') do
  require 'about_keyword_arguments' # done
end
require 'about_constants' # done
require 'about_regular_expressions' # done
require 'about_control_statements' # required and done
require 'about_triangle_project' # done
require 'about_exceptions' # done
require 'about_triangle_project_2' # done
require 'about_iteration' # done
require 'about_blocks' # required and done
require 'about_sandwich_code' # done
require 'about_scoring_project' # done
require 'about_classes' # required and done
require 'about_open_classes' # done
require 'about_dice_project' # done
require 'about_inheritance' # done
require 'about_modules' # done
require 'about_scope' # done
require 'about_class_methods' # done
require 'about_message_passing' # done
require 'about_proxy_object_project' # done
require 'about_to_str'
in_ruby_version('jruby') do
  require 'about_java_interop' # recommended? Not using jruby but MRI
end
in_ruby_version('2.7') do
  require 'about_pattern_matching' # recommended? using ruby 2.6
end
require 'about_extra_credit' # recommended?
