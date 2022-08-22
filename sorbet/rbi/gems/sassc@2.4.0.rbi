# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `sassc` gem.
# Please instead update this file by running `bin/tapioca gem sassc`.

module SassC
  class << self
    # The global load paths for Sass files. This is meant for plugins and
    # libraries to register the paths to their Sass stylesheets to that they may
    # be `@imported`. This load path is used by every instance of {Sass::Engine}.
    # They are lower-precedence than any load paths passed in via the
    # {file:SASS_REFERENCE.md#load_paths-option `:load_paths` option}.
    #
    # If the `SASS_PATH` environment variable is set,
    # the initial value of `load_paths` will be initialized based on that.
    # The variable should be a colon-separated list of path names
    # (semicolon-separated on Windows).
    #
    # Note that files on the global load path are never compiled to CSS
    # themselves, even if they aren't partials. They exist only to be imported.
    #
    # @example
    #   SassC.load_paths << File.dirname(__FILE__ + '/sass')
    # @return [Array<String, Pathname, Sass::Importers::Base>]
    def load_paths; end
  end
end

class SassC::BaseError < ::StandardError; end

class SassC::Dependency
  # @return [Dependency] a new instance of Dependency
  def initialize(filename); end

  # Returns the value of attribute filename.
  def filename; end

  # Returns the value of attribute options.
  def options; end

  class << self
    def from_filenames(filenames); end
  end
end

class SassC::Engine
  # @return [Engine] a new instance of Engine
  def initialize(template, options = T.unsafe(nil)); end

  # @raise [NotRenderedError]
  def dependencies; end

  def filename; end

  # Returns the value of attribute options.
  def options; end

  def render; end

  # @raise [NotRenderedError]
  def source_map; end

  # Returns the value of attribute template.
  def template; end

  private

  def functions_handler; end
  def import_handler; end

  # @return [Boolean]
  def line_comments?; end

  def load_paths; end

  # @return [Boolean]
  def omit_source_map_url?; end

  def output_style; end
  def output_style_enum; end
  def precision; end

  # @return [Boolean]
  def quiet?; end

  # @return [Boolean]
  def sass?; end

  # @return [Boolean]
  def source_map_contents?; end

  # @return [Boolean]
  def source_map_embed?; end

  def source_map_file; end
end

SassC::Engine::OUTPUT_STYLES = T.let(T.unsafe(nil), Array)

class SassC::FunctionsHandler
  # @return [FunctionsHandler] a new instance of FunctionsHandler
  def initialize(options); end

  def setup(native_options, functions: T.unsafe(nil)); end

  private

  def arguments_from_native_list(native_argument_list); end
  def error(message); end
  def to_native_value(sass_value); end
end

class SassC::ImportHandler
  # @return [ImportHandler] a new instance of ImportHandler
  def initialize(options); end

  def setup(native_options); end

  private

  def import_function; end
  def imports_to_native(imports); end
end

class SassC::Importer
  # @return [Importer] a new instance of Importer
  def initialize(options); end

  # @raise [NotImplementedError]
  def imports(path, parent_path); end

  # Returns the value of attribute options.
  def options; end
end

class SassC::Importer::Import
  # @return [Import] a new instance of Import
  def initialize(path, source: T.unsafe(nil), source_map_path: T.unsafe(nil)); end

  # Returns the value of attribute path.
  def path; end

  # Sets the attribute path
  #
  # @param value the value to set the attribute path to.
  def path=(_arg0); end

  # Returns the value of attribute source.
  def source; end

  # Sets the attribute source
  #
  # @param value the value to set the attribute source to.
  def source=(_arg0); end

  # Returns the value of attribute source_map_path.
  def source_map_path; end

  # Sets the attribute source_map_path
  #
  # @param value the value to set the attribute source_map_path to.
  def source_map_path=(_arg0); end

  def to_s; end
end

class SassC::InvalidStyleError < ::SassC::BaseError; end

module SassC::Native
  extend ::FFI::Library

  def _context_get_included_files(*_arg0); end
  def _make_data_context(*_arg0); end
  def boolean_get_value(*_arg0); end
  def color_get_a(*_arg0); end
  def color_get_b(*_arg0); end
  def color_get_g(*_arg0); end
  def color_get_r(*_arg0); end
  def color_set_a(*_arg0); end
  def color_set_b(*_arg0); end
  def color_set_g(*_arg0); end
  def color_set_r(*_arg0); end
  def compile_data_context(*_arg0); end
  def compile_file_context(*_arg0); end
  def compiler_get_last_import(*_arg0); end
  def context_get_error_column(*_arg0); end
  def context_get_error_file(*_arg0); end
  def context_get_error_json(*_arg0); end
  def context_get_error_line(*_arg0); end
  def context_get_error_message(*_arg0); end
  def context_get_error_status(*_arg0); end
  def context_get_options(*_arg0); end
  def context_get_output_string(*_arg0); end
  def context_get_source_map_string(*_arg0); end
  def data_context_get_context(*_arg0); end
  def data_context_get_options(*_arg0); end
  def data_context_set_options(*_arg0); end
  def delete_data_context(*_arg0); end
  def delete_file_context(*_arg0); end
  def error_get_message(*_arg0); end
  def error_set_message(*_arg0); end
  def file_context_get_context(*_arg0); end
  def file_context_get_options(*_arg0); end
  def file_context_set_options(*_arg0); end
  def function_get_cookie(*_arg0); end
  def function_get_function(*_arg0); end
  def function_get_list_entry(*_arg0); end
  def function_get_signature(*_arg0); end
  def function_set_list_entry(*_arg0); end
  def import_get_abs_path(*_arg0); end
  def import_get_imp_path(*_arg0); end
  def import_get_source(*_arg0); end
  def import_set_list_entry(*_arg0); end
  def list_get_length(*_arg0); end
  def list_get_value(*_arg0); end
  def list_set_value(*_arg0); end
  def make_boolean(*_arg0); end
  def make_color(*_arg0); end
  def make_error(*_arg0); end
  def make_file_context(*_arg0); end
  def make_function(*_arg0); end
  def make_function_list(*_arg0); end
  def make_import_entry(*_arg0); end
  def make_import_list(*_arg0); end
  def make_importer(*_arg0); end
  def make_list(*_arg0); end
  def make_map(*_arg0); end
  def make_number(*_arg0); end
  def make_options(*_arg0); end
  def make_qstring(*_arg0); end
  def make_string(*_arg0); end
  def map_get_key(*_arg0); end
  def map_get_length(*_arg0); end
  def map_get_value(*_arg0); end
  def map_set_key(*_arg0); end
  def map_set_value(*_arg0); end
  def number_get_unit(*_arg0); end
  def number_get_value(*_arg0); end
  def option_get_c_functions(*_arg0); end
  def option_get_include_path(*_arg0); end
  def option_get_input_path(*_arg0); end
  def option_get_is_indented_syntax_src(*_arg0); end
  def option_get_omit_source_map_url(*_arg0); end
  def option_get_output_path(*_arg0); end
  def option_get_output_style(*_arg0); end
  def option_get_precision(*_arg0); end
  def option_get_source_comments(*_arg0); end
  def option_get_source_map_contents(*_arg0); end
  def option_get_source_map_embed(*_arg0); end
  def option_get_source_map_file(*_arg0); end
  def option_set_c_functions(*_arg0); end
  def option_set_c_importers(*_arg0); end
  def option_set_include_path(*_arg0); end
  def option_set_input_path(*_arg0); end
  def option_set_is_indented_syntax_src(*_arg0); end
  def option_set_omit_source_map_url(*_arg0); end
  def option_set_output_path(*_arg0); end
  def option_set_output_style(*_arg0); end
  def option_set_precision(*_arg0); end
  def option_set_source_comments(*_arg0); end
  def option_set_source_map_contents(*_arg0); end
  def option_set_source_map_embed(*_arg0); end
  def option_set_source_map_file(*_arg0); end
  def sass2scss(*_arg0); end
  def string_get_value(*_arg0); end
  def string_is_quoted(*_arg0); end
  def value_get_tag(*_arg0); end
  def value_is_null(*_arg0); end
  def version(*_arg0); end

  class << self
    def _context_get_included_files(*_arg0); end
    def _make_data_context(*_arg0); end

    # Remove the redundant "sass_" from the beginning of every method name
    def attach_function(*args); end

    def boolean_get_value(*_arg0); end
    def color_get_a(*_arg0); end
    def color_get_b(*_arg0); end
    def color_get_g(*_arg0); end
    def color_get_r(*_arg0); end
    def color_set_a(*_arg0); end
    def color_set_b(*_arg0); end
    def color_set_g(*_arg0); end
    def color_set_r(*_arg0); end
    def compile_data_context(*_arg0); end
    def compile_file_context(*_arg0); end
    def compiler_get_last_import(*_arg0); end
    def context_get_error_column(*_arg0); end
    def context_get_error_file(*_arg0); end
    def context_get_error_json(*_arg0); end
    def context_get_error_line(*_arg0); end
    def context_get_error_message(*_arg0); end
    def context_get_error_status(*_arg0); end
    def context_get_included_files(*args); end
    def context_get_options(*_arg0); end
    def context_get_output_string(*_arg0); end
    def context_get_source_map_string(*_arg0); end
    def data_context_get_context(*_arg0); end
    def data_context_get_options(*_arg0); end
    def data_context_set_options(*_arg0); end
    def delete_data_context(*_arg0); end
    def delete_file_context(*_arg0); end
    def error_get_message(*_arg0); end
    def error_set_message(*_arg0); end
    def file_context_get_context(*_arg0); end
    def file_context_get_options(*_arg0); end
    def file_context_set_options(*_arg0); end
    def function_get_cookie(*_arg0); end
    def function_get_function(*_arg0); end
    def function_get_list_entry(*_arg0); end
    def function_get_signature(*_arg0); end
    def function_set_list_entry(*_arg0); end
    def import_get_abs_path(*_arg0); end
    def import_get_imp_path(*_arg0); end
    def import_get_source(*_arg0); end
    def import_set_list_entry(*_arg0); end
    def list_get_length(*_arg0); end
    def list_get_value(*_arg0); end
    def list_set_value(*_arg0); end
    def make_boolean(*_arg0); end
    def make_color(*_arg0); end
    def make_data_context(data); end
    def make_error(*_arg0); end
    def make_file_context(*_arg0); end
    def make_function(*_arg0); end
    def make_function_list(*_arg0); end
    def make_import_entry(*_arg0); end
    def make_import_list(*_arg0); end
    def make_importer(*_arg0); end
    def make_list(*_arg0); end
    def make_map(*_arg0); end
    def make_number(*_arg0); end
    def make_options(*_arg0); end
    def make_qstring(*_arg0); end
    def make_string(*_arg0); end
    def map_get_key(*_arg0); end
    def map_get_length(*_arg0); end
    def map_get_value(*_arg0); end
    def map_set_key(*_arg0); end
    def map_set_value(*_arg0); end
    def native_string(string); end
    def number_get_unit(*_arg0); end
    def number_get_value(*_arg0); end
    def option_get_c_functions(*_arg0); end
    def option_get_include_path(*_arg0); end
    def option_get_input_path(*_arg0); end
    def option_get_is_indented_syntax_src(*_arg0); end
    def option_get_omit_source_map_url(*_arg0); end
    def option_get_output_path(*_arg0); end
    def option_get_output_style(*_arg0); end
    def option_get_precision(*_arg0); end
    def option_get_source_comments(*_arg0); end
    def option_get_source_map_contents(*_arg0); end
    def option_get_source_map_embed(*_arg0); end
    def option_get_source_map_file(*_arg0); end
    def option_set_c_functions(*_arg0); end
    def option_set_c_importers(*_arg0); end
    def option_set_include_path(*_arg0); end
    def option_set_input_path(*_arg0); end
    def option_set_is_indented_syntax_src(*_arg0); end
    def option_set_omit_source_map_url(*_arg0); end
    def option_set_output_path(*_arg0); end
    def option_set_output_style(*_arg0); end
    def option_set_precision(*_arg0); end
    def option_set_source_comments(*_arg0); end
    def option_set_source_map_contents(*_arg0); end
    def option_set_source_map_embed(*_arg0); end
    def option_set_source_map_file(*_arg0); end

    # https://github.com/ffi/ffi/wiki/Examples#array-of-strings
    def return_string_array(ptr); end

    def sass2scss(*_arg0); end
    def string_get_type(native_value); end
    def string_get_value(*_arg0); end
    def string_is_quoted(*_arg0); end
    def value_get_tag(*_arg0); end
    def value_is_null(*_arg0); end
    def version(*_arg0); end
  end
end

class SassC::Native::SassBoolean < ::FFI::Struct; end
class SassC::Native::SassColor < ::FFI::Struct; end
class SassC::Native::SassError < ::FFI::Struct; end
SassC::Native::SassInputStyle = T.let(T.unsafe(nil), FFI::Enum)
class SassC::Native::SassList < ::FFI::Struct; end
class SassC::Native::SassMap < ::FFI::Struct; end
class SassC::Native::SassMapPair < ::FFI::Struct; end
class SassC::Native::SassNull < ::FFI::Struct; end
class SassC::Native::SassNumber < ::FFI::Struct; end
SassC::Native::SassOutputStyle = T.let(T.unsafe(nil), FFI::Enum)
SassC::Native::SassSeparator = T.let(T.unsafe(nil), FFI::Enum)
class SassC::Native::SassString < ::FFI::Struct; end
SassC::Native::SassTag = T.let(T.unsafe(nil), FFI::Enum)
class SassC::Native::SassUnknown < ::FFI::Struct; end

# < FFI::Union
class SassC::Native::SassValue < ::FFI::Union; end

class SassC::Native::SassWarning < ::FFI::Struct; end
class SassC::Native::StringList < ::FFI::Struct; end
class SassC::NotRenderedError < ::SassC::BaseError; end

class SassC::Sass2Scss
  class << self
    def convert(sass); end
  end
end

module SassC::Script
  class << self
    def custom_functions(functions: T.unsafe(nil)); end
    def formatted_function_name(function_name, functions: T.unsafe(nil)); end
  end
end

module SassC::Script::Functions; end

# The abstract superclass for SassScript objects.
# Many of these methods, especially the ones that correspond to SassScript operations,
# are designed to be overridden by subclasses which may change the semantics somewhat.
# The operations listed here are just the defaults.
class SassC::Script::Value
  # Creates a new value.
  #
  # @return [Value] a new instance of Value
  def initialize(value = T.unsafe(nil)); end

  # Compares this object to `other`
  def ==(other); end

  # @raise [SassC::SyntaxError] if this value isn't an integer
  def assert_int!; end

  # Whether the value is surrounded by square brackets. For non-list values,
  # this will be `false`.
  def bracketed; end

  # True if this Value is the same as `other`
  #
  # @return [Boolean]
  def eql?(other); end

  # Returns the hash code of this value. Two objects' hash codes should be
  # equal if the objects are equal.
  def hash; end

  # Returns a system inspect value for this object
  def inspect; end

  # Returns `false` (all Values are truthy)
  #
  # @return [Boolean]
  def null?; end

  # Returns the options hash for this node.
  # Raises SassC::SyntaxError if the value was created
  # outside of the parser and \{#to\_s} was called on it
  #
  # @raise [SassC::SyntaxError]
  def options; end

  # Sets the options hash for this node,
  # as well as for all child nodes.
  # See the official Sass reference for options.
  def options=(_arg0); end

  # Returns the separator for this value. For non-list-like values or the
  # empty list, this will be `nil`. For lists or maps, it will be `:space` or `:comma`.
  def separator; end

  # The source range in the document on which this node appeared.
  def source_range; end

  # The source range in the document on which this node appeared.
  def source_range=(_arg0); end

  # Returns the value of this Value as an array.
  # Single Values are considered the same as single-element arrays.
  def to_a; end

  # Returns `true` (all Values are truthy)
  def to_bool; end

  # Returns the value of this value as a hash. Most values don't have hash
  # representations, but [Map]s and empty [List]s do.
  #
  # @raise [SassC::SyntaxError] if this value doesn't have a hash representation
  # @return [Hash<Value, Value>] This value as a hash
  def to_h; end

  # Returns the integer value of this value.
  # Raises SassC::SyntaxError if this value doesn’t implment integer conversion.
  #
  # @raise [SassC::SyntaxError]
  def to_i; end

  # Returns the string representation of this value
  # as it would be output to the CSS document.
  #
  # @return [String]
  def to_s(opts = T.unsafe(nil)); end

  # Returns the string representation of this value
  # as it would be output to the CSS document.
  #
  # @return [String]
  def to_sass(opts = T.unsafe(nil)); end

  # Returns the pure Ruby value of the value.
  # The type of this value varies based on the subclass.
  def value; end

  # Creates a new list containing `contents` but with the same brackets and
  # separators as this object, when interpreted as a list.
  #
  # @param contents [Array<Value>] The contents of the new list.
  # @param separator [Symbol] The separator of the new list. Defaults to \{#separator}.
  # @param bracketed [Boolean] Whether the new list is bracketed. Defaults to \{#bracketed}.
  # @return [Sass::Script::Value::List]
  def with_contents(contents, separator: T.unsafe(nil), bracketed: T.unsafe(nil)); end

  protected

  # Evaluates the value.
  #
  # @param environment [Sass::Environment] The environment in which to evaluate the SassScript
  # @return [Value] This value
  def _perform(environment); end
end

# A SassScript object representing a boolean (true or false) value.
class SassC::Script::Value::Bool < ::SassC::Script::Value
  # The pure Ruby value of this Boolean
  def to_bool; end

  # Returns the string "true" or "false" for this value
  def to_s(opts = T.unsafe(nil)); end

  # Returns the string "true" or "false" for this value
  def to_sass(opts = T.unsafe(nil)); end

  # The pure Ruby value of this Boolean
  def value; end

  class << self
    # We override object creation so that users of the core API
    # will not need to know that booleans are specific constants.
    # Tests `value` for truthiness and returns the TRUE or FALSE constant.
    def new(value); end
  end
end

# The false value in SassScript.
# This is assigned before new is overridden below so that we use the default implementation.
SassC::Script::Value::Bool::FALSE = T.let(T.unsafe(nil), SassC::Script::Value::Bool)

# The true value in SassScript.
# This is assigned before new is overridden below so that we use the default implementation.
SassC::Script::Value::Bool::TRUE = T.let(T.unsafe(nil), SassC::Script::Value::Bool)

# A SassScript object representing a CSS color.
# This class provides a very bare-bones system for storing a RGB(A) or HSL(A)
# color and converting it to a CSS color function.
#
# If your Sass method accepts a  color you will need to perform any
# needed color mathematics or transformations yourself.
class SassC::Script::Value::Color < ::SassC::Script::Value
  # Creates a new color with (`red`, `green`, `blue`) or (`hue`, `saturation`, `lightness`
  # values, plus an optional `alpha` transparency value.
  #
  # @return [Color] a new instance of Color
  def initialize(red: T.unsafe(nil), green: T.unsafe(nil), blue: T.unsafe(nil), hue: T.unsafe(nil), saturation: T.unsafe(nil), lightness: T.unsafe(nil), alpha: T.unsafe(nil)); end

  # True if this Color is equal to `other_color`
  #
  # @return [Boolean]
  def ==(other_color); end

  # Returns the value of attribute alpha.
  def alpha; end

  # Returns the alpha value of this color as a string
  # and rounded to 8 decimal places.
  def alpha_string; end

  # Returns the value of attribute blue.
  def blue; end

  # True if this Color is equal to `other_color`
  #
  # @return [Boolean]
  def eql?(other_color); end

  # Returns the value of attribute green.
  def green; end

  # Returns a numeric value for comparing two Color objects
  # This method is used internally by the Hash class and is not the same as `.to_h`
  def hash; end

  # True if this color has HSLA values
  #
  # @return [Boolean]
  def hlsa?; end

  # Returns the value of attribute hue.
  def hue; end

  # Returns the value of attribute lightness.
  def lightness; end

  # Returns the value of attribute red.
  def red; end

  # True if this color has RGBA values
  #
  # @return [Boolean]
  def rgba?; end

  # Returns the value of attribute saturation.
  def saturation; end

  # Returns a CSS color declaration in the form
  # `rgb(…)`, `rgba(…)`, `hsl(…)`, or `hsla(…)`.
  def to_s; end

  # Returns the values of this color in an array.
  # Provided for compatibility between different SassC::Script::Value classes
  def value; end
end

# A SassScript object representing a CSS list.
# This includes both comma-separated lists and space-separated lists.
class SassC::Script::Value::List < ::SassC::Script::Value
  # Creates a new list.
  #
  # @param value [Array<Value>] See \{#value}
  # @param separator [Symbol] See \{#separator}
  # @param bracketed [Boolean] See \{#bracketed}
  # @return [List] a new instance of List
  def initialize(value, separator: T.unsafe(nil), bracketed: T.unsafe(nil)); end

  # Whether the list is surrounded by square brackets.
  #
  # @return [Boolean]
  def bracketed; end

  # @see Value#eq
  def eq(other); end

  def hash; end

  # @see Value#inspect
  def inspect; end

  # @see Value#options=
  def options=(options); end

  # The operator separating the values of the list.
  # Either `:comma` or `:space`.
  #
  # @return [Symbol]
  def separator; end

  # The Ruby array containing the contents of the list.
  #
  # @return [Array<Value>]
  def to_a; end

  # @see Value#to_h
  def to_h; end

  # @see Value#to_s
  def to_s(opts = T.unsafe(nil)); end

  # @see Value#to_sass
  def to_sass(opts = T.unsafe(nil)); end

  # The Ruby array containing the contents of the list.
  #
  # @return [Array<Value>]
  def value; end

  private

  # @return [Boolean]
  def element_needs_parens?(element); end

  def sep_str(opts = T.unsafe(nil)); end

  class << self
    # Asserts an index is within the list.
    #
    # @param list [Sass::Script::Value::List] The list for which the index should be checked.
    # @param n [Sass::Script::Value::Number] The index being checked.
    # @private
    def assert_valid_index(list, n); end
  end
end

class SassC::Script::Value::Map < ::SassC::Script::Value
  # Creates a new map.
  #
  # @param hash [Hash<Node, Node>]
  # @return [Map] a new instance of Map
  def initialize(hash); end

  # @see Value#eq
  def eq(other); end

  def hash; end
  def inspect(opts = T.unsafe(nil)); end

  # @see Value#options=
  def options=(options); end

  # @see Value#separator
  def separator; end

  # @see Value#to_a
  def to_a; end

  # The Ruby hash containing the contents of this map.
  #
  # @return [Hash<Node, Node>]
  def to_h; end

  # @raise [SassC::SyntaxError]
  # @see Value#to_s
  def to_s(opts = T.unsafe(nil)); end

  def to_sass(opts = T.unsafe(nil)); end

  # The Ruby hash containing the contents of this map.
  #
  # @return [Hash<Node, Node>]
  def value; end
end

# A SassScript object representing a number.
# SassScript numbers can have decimal values,
# and can also have units.
# For example, `12`, `1px`, and `10.45em`
# are all valid values.
#
# Numbers can also have more complex units, such as `1px*em/in`.
# These cannot be inputted directly in Sass code at the moment.
class SassC::Script::Value::Number < ::SassC::Script::Value
  # @param value [Numeric] The value of the number
  # @param numerator_units [::String, Array<::String>] See \{#numerator\_units}
  # @param denominator_units [::String, Array<::String>] See \{#denominator\_units}
  # @return [Number] a new instance of Number
  def initialize(value, numerator_units = T.unsafe(nil), denominator_units = T.unsafe(nil)); end

  # Returns this number converted to other units.
  # The conversion takes into account the relationship between e.g. mm and cm,
  # as well as between e.g. in and cm.
  #
  # If this number has no units, it will simply return itself
  # with the given units.
  #
  # An incompatible coercion, e.g. between px and cm, will raise an error.
  #
  # @param num_units [Array<String>] The numerator units to coerce this number into.
  #   See {\#numerator\_units}
  # @param den_units [Array<String>] The denominator units to coerce this number into.
  #   See {\#denominator\_units}
  # @raise [Sass::UnitConversionError] if the given units are incompatible with the number's
  #   current units
  # @return [Number] The number with the new units
  def coerce(num_units, den_units); end

  # @param other [Number] A number to decide if it can be compared with this number.
  # @return [Boolean] Whether or not this number can be compared with the other.
  def comparable_to?(other); end

  # A list of units in the denominator of the number.
  # For example, `1px*em/in*cm` would return `["in", "cm"]`
  #
  # @return [Array<String>]
  def denominator_units; end

  # Hash-equality works differently than `==` equality for numbers.
  # Hash-equality must be transitive, so it just compares the exact value,
  # numerator units, and denominator units.
  #
  # @return [Boolean]
  def eql?(other); end

  def hash; end

  # Returns a readable representation of this number.
  #
  # This representation is valid CSS (and valid SassScript)
  # as long as there is only one unit.
  #
  # @return [String] The representation
  def inspect(opts = T.unsafe(nil)); end

  # @return [Boolean] Whether or not this number is an integer.
  def int?; end

  # Checks whether the number has the numerator unit specified.
  #
  # @example
  #   number = Sass::Script::Value::Number.new(10, "px")
  #   number.is_unit?("px") => true
  #   number.is_unit?(nil) => false
  # @param unit [::String, nil] The unit the number should have or nil if the number
  #   should be unitless.
  # @return [Boolean]
  # @see Number#unitless? The unitless? method may be more readable.
  def is_unit?(unit); end

  # @return [Boolean] Whether or not this number has units that can be represented in CSS
  #   (that is, zero or one \{#numerator\_units}).
  def legal_units?; end

  # A list of units in the numerator of the number.
  # For example, `1px*em/in*cm` would return `["px", "em"]`
  #
  # @return [Array<String>]
  def numerator_units; end

  # The original representation of this number.
  # For example, although the result of `1px/2px` is `0.5`,
  # the value of `#original` is `"1px/2px"`.
  #
  # This is only non-nil when the original value should be used as the CSS value,
  # as in `font: 1px/2px`.
  #
  # @return [Boolean, nil]
  def original; end

  # The original representation of this number.
  # For example, although the result of `1px/2px` is `0.5`,
  # the value of `#original` is `"1px/2px"`.
  #
  # This is only non-nil when the original value should be used as the CSS value,
  # as in `font: 1px/2px`.
  #
  # @return [Boolean, nil]
  def original=(_arg0); end

  # @raise [Sass::SyntaxError] if the number isn't an integer
  # @return [Integer] The integer value of the number
  def to_i; end

  # @raise [Sass::SyntaxError] if this number has units that can't be used in CSS
  #   (e.g. `px*in`)
  # @return [String] The CSS representation of this number
  def to_s(opts = T.unsafe(nil)); end

  # Returns a readable representation of this number.
  #
  # This representation is valid CSS (and valid SassScript)
  # as long as there is only one unit.
  #
  # @return [String] The representation
  def to_sass(opts = T.unsafe(nil)); end

  # Returns a human readable representation of the units in this number.
  # For complex units this takes the form of:
  # numerator_unit1 * numerator_unit2 / denominator_unit1 * denominator_unit2
  #
  # @return [String] a string that represents the units in this number
  def unit_str; end

  # @return [Boolean] Whether or not this number has no units.
  def unitless?; end

  # The Ruby value of the number.
  #
  # @return [Numeric]
  def value; end

  private

  # @private
  # @return [Boolean]
  # @see Sass::Script::Number.basically_equal?
  def basically_equal?(num1, num2); end

  def coercion_factor(from_units, to_units); end
  def compute_units(this, other, operation); end
  def conversion_factor(from_unit, to_unit); end

  # @return [Boolean]
  def convertable?(units); end

  def normalize!; end
  def operate(other, operation); end
  def sans_common_units(units1, units2); end

  class << self
    # Checks whether two numbers are within an epsilon of each other.
    #
    # @return [Boolean]
    def basically_equal?(num1, num2); end

    # Used in checking equality of floating point numbers. Any
    # numbers within an `epsilon` of each other are considered functionally equal.
    # The value for epsilon is one tenth of the current numeric precision.
    def epsilon; end

    def precision; end

    # Sets the number of digits of precision
    # For example, if this is `3`,
    # `3.1415926` will be printed as `3.142`.
    # The numeric precision is stored as a thread local for thread safety reasons.
    # To set for all threads, be sure to set the precision on the main thread.
    def precision=(digits); end

    # the precision factor used in numeric output
    # it is derived from the `precision` method.
    def precision_factor; end

    # @private
    def round(num); end
  end
end

# A two-dimensional hash from two units to the conversion ratio between
# them. Multiply `X` by `CONVERSION_TABLE[X][Y]` to convert it to `Y`.
SassC::Script::Value::Number::CONVERSION_TABLE = T.let(T.unsafe(nil), Hash)

# A hash from each known unit to the set of units that it's mutually
# convertible with.
SassC::Script::Value::Number::MUTUALLY_CONVERTIBLE = T.let(T.unsafe(nil), Hash)

# Used so we don't allocate two new arrays for each new number.
SassC::Script::Value::Number::NO_UNITS = T.let(T.unsafe(nil), Array)

SassC::Script::Value::Number::OPERATIONS = T.let(T.unsafe(nil), Array)

class SassC::Script::Value::String < ::SassC::Script::Value
  # Creates a new string.
  #
  # @param value [String] See \{#value}
  # @param type [Symbol] See \{#type}
  # @param deprecated_interp_equivalent [String?] If this was created via a potentially-deprecated string interpolation,
  #   this is the replacement expression that should be suggested to the user.
  # @return [String] a new instance of String
  def initialize(value, type = T.unsafe(nil)); end

  def inspect; end

  # @see Value#plus
  def plus(other); end

  # @see Value#to_s
  def to_s(opts = T.unsafe(nil)); end

  # @see Value#to_sass
  def to_sass(opts = T.unsafe(nil)); end

  # Whether this is a CSS string or a CSS identifier.
  # The difference is that strings are written with double-quotes,
  # while identifiers aren't.
  #
  # @return [Symbol] `:string` or `:identifier`
  def type; end

  # The Ruby value of the string.
  def value; end

  class << self
    # Returns the quoted string representation of `contents`.
    def quote(contents, opts = T.unsafe(nil)); end
  end
end

module SassC::Script::ValueConversion
  class << self
    def from_native(native_value, options); end
    def to_native(value); end
  end
end

class SassC::Script::ValueConversion::Base
  # @return [Base] a new instance of Base
  def initialize(value); end
end

class SassC::Script::ValueConversion::Bool < ::SassC::Script::ValueConversion::Base
  def to_native; end
end

class SassC::Script::ValueConversion::Color < ::SassC::Script::ValueConversion::Base
  def to_native; end
end

class SassC::Script::ValueConversion::List < ::SassC::Script::ValueConversion::Base
  def to_native; end
end

class SassC::Script::ValueConversion::Map < ::SassC::Script::ValueConversion::Base
  def to_native; end
end

class SassC::Script::ValueConversion::Number < ::SassC::Script::ValueConversion::Base
  def to_native; end
end

SassC::Script::ValueConversion::SEPARATORS = T.let(T.unsafe(nil), Hash)

class SassC::Script::ValueConversion::String < ::SassC::Script::ValueConversion::Base
  def to_native(opts = T.unsafe(nil)); end
end

# When dealing with SyntaxErrors,
# it's important to provide filename and line number information.
# This will be used in various error reports to users, including backtraces.
class SassC::SyntaxError < ::SassC::BaseError
  # @return [SyntaxError] a new instance of SyntaxError
  def initialize(message, filename: T.unsafe(nil), line: T.unsafe(nil)); end

  def backtrace; end

  # The backtrace of the error within Sass files.
  def sass_backtrace; end
end

class SassC::UnsupportedValue < ::SassC::BaseError; end

# A module containing various useful functions.
module SassC::Util
  extend ::SassC::Util

  private

  # Throws a NotImplementedError for an abstract method.
  #
  # @param obj [Object] `self`
  # @raise [NotImplementedError]
  def abstract(obj); end

  # Returns information about the caller of the previous method.
  #
  # @param entry [String] An entry in the `#caller` list, or a similarly formatted string
  # @return [[String, Integer, (String, nil)]] An array containing the filename, line, and method name of the caller.
  #   The method name may be nil
  def caller_info(entry = T.unsafe(nil)); end

  # Restricts the numeric `value` to be within `min` and `max`, inclusive.
  # If the value is lower than `min`
  def clamp(value, min, max); end

  # Prints a deprecation warning for the caller method.
  #
  # @param obj [Object] `self`
  # @param message [String] A message describing what to do instead.
  def deprecated(obj, message = T.unsafe(nil)); end

  # Whether or not this is running on IronRuby.
  #
  # @return [Boolean]
  def ironruby?; end

  # Whether or not this is running on JRuby.
  #
  # @return [Boolean]
  def jruby?; end

  # Returns an array of ints representing the JRuby version number.
  #
  # @return [Array<Integer>]
  def jruby_version; end

  # Maps the keys in a hash according to a block.
  #
  # @example
  #   map_keys({:foo => "bar", :baz => "bang"}) {|k| k.to_s}
  #   #=> {"foo" => "bar", "baz" => "bang"}
  # @param hash [Hash] The hash to map
  # @return [Hash] The mapped hash
  # @see #map_hash
  # @see #map_vals
  # @yield [key] A block in which the keys are transformed
  # @yieldparam key [Object] The key that should be mapped
  # @yieldreturn [Object] The new value for the key
  def map_keys(hash); end

  # Return an array of all possible paths through the given arrays.
  #
  # @example
  #   paths([[1, 2], [3, 4], [5]]) #=>
  #   # [[1, 3, 5],
  #   #  [2, 3, 5],
  #   #  [1, 4, 5],
  #   #  [2, 4, 5]]
  # @param arrs [Array<Array>]
  # @return [Array<Arrays>]
  def paths(arrs); end

  # Returns the environment of the Rails application,
  # if this is running in a Rails context.
  # Returns `nil` if no such environment is defined.
  #
  # @return [String, nil]
  def rails_env; end

  # Returns the root of the Rails application,
  # if this is running in a Rails context.
  # Returns `nil` if no such root is defined.
  #
  # @return [String, nil]
  def rails_root; end

  # Whether or not this is running on Rubinius.
  #
  # @return [Boolean]
  def rbx?; end

  # Returns `path` relative to `from`.
  #
  # This is like `Pathname#relative_path_from` except it accepts both strings
  # and pathnames, it handles Windows path separators correctly, and it throws
  # an error rather than crashing if the paths use different encodings
  # (https://github.com/ruby/ruby/pull/713).
  #
  # @param path [String, Pathname]
  # @param from [String, Pathname]
  # @return [Pathname?]
  def relative_path_from(path, from); end

  # Like [Fixnum.round], but leaves rooms for slight floating-point
  # differences.
  #
  # @param value [Numeric]
  # @return [Numeric]
  def round(value); end

  # The same as `Kernel#warn`, but is silenced by \{#silence\_sass\_warnings}.
  #
  # @param msg [String]
  def sass_warn(msg); end

  # Silences all Sass warnings within a block.
  #
  # @yield A block in which no Sass warnings will be printed
  def silence_sass_warnings; end

  # Whether or not this is running on Windows.
  #
  # @return [Boolean]
  def windows?; end

  class << self
    def abstract(obj); end
    def caller_info(entry = T.unsafe(nil)); end
    def clamp(value, min, max); end
    def deprecated(obj, message = T.unsafe(nil)); end
    def ironruby?; end
    def jruby?; end
    def jruby_version; end
    def map_keys(hash); end
    def paths(arrs); end
    def rails_env; end
    def rails_root; end
    def rbx?; end
    def relative_path_from(path, from); end
    def round(value); end
    def sass_warn(msg); end
    def silence_sass_warnings; end
    def windows?; end
  end
end

# A hash that normalizes its string keys while still allowing you to get back
# to the original keys that were stored. If several different values normalize
# to the same value, whichever is stored last wins.
class SassC::Util::NormalizedMap
  # Create a normalized map
  #
  # @return [NormalizedMap] a new instance of NormalizedMap
  def initialize(map = T.unsafe(nil)); end

  # @private
  def [](k); end

  # @private
  def []=(k, v); end

  # @return [Hash] Hash with the keys as they were stored (before normalization).
  def as_stored; end

  # @private
  def delete(k); end

  # Returns the version of `key` as it was stored before
  # normalization. If `key` isn't in the map, returns it as it was
  # passed in.
  #
  # @return [String]
  def denormalize(key); end

  def dup; end
  def each; end

  # @return [Boolean]
  def empty?; end

  # @private
  # @return [Boolean]
  def has_key?(k); end

  def keys; end
  def map; end
  def method_missing(method, *args, &block); end

  # Specifies how to transform the key.
  # This can be overridden to create other normalization behaviors.
  def normalize(key); end

  def size; end
  def sort_by; end
  def to_a; end
  def to_hash; end
  def update(map); end
  def values; end

  private

  # @return [Boolean]
  def respond_to_missing?(method, include_private = T.unsafe(nil)); end
end

# The Ruby engine we're running under. Defaults to `"ruby"`
# if the top-level constant is undefined.
#
# @api public
SassC::Util::RUBY_ENGINE = T.let(T.unsafe(nil), String)

# An array of ints representing the Ruby version number.
#
# @api public
SassC::Util::RUBY_VERSION_COMPONENTS = T.let(T.unsafe(nil), Array)

SassC::VERSION = T.let(T.unsafe(nil), String)
