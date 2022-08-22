# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `tilt` gem.
# Please instead update this file by running `bin/tapioca gem tilt`.

# Namespace for Tilt. This module is not intended to be included anywhere.
module Tilt
  class << self
    # @see Tilt::Mapping#[]
    def [](file); end

    # @example
    #   tmpl = Tilt['index.erb'].new { '<%= Tilt.current_template %>' }
    #   tmpl.render == tmpl.to_s
    # @note This is currently an experimental feature and might return nil
    #   in the future.
    # @return the template object that is currently rendering.
    def current_template; end

    # @return [Tilt::Mapping] the main mapping object
    def default_mapping; end

    # @private
    def lazy_map; end

    # @see Tilt::Mapping#new
    def new(file, line = T.unsafe(nil), options = T.unsafe(nil), &block); end

    # @deprecated Use {register} instead.
    def prefer(template_class, *extensions); end

    # @see Tilt::Mapping#register
    def register(template_class, *extensions); end

    # @see Tilt::Mapping#register_lazy
    def register_lazy(class_name, file, *extensions); end

    # @return [Boolean]
    # @see Tilt::Mapping#registered?
    def registered?(ext); end

    # @see Tilt::Mapping#template_for
    def template_for(file); end

    # @see Tilt::Mapping#templates_for
    def templates_for(file); end
  end
end

# Builder template implementation. See:
# http://builder.rubyforge.org/
class Tilt::BuilderTemplate < ::Tilt::Template
  def evaluate(scope, locals, &block); end
  def precompiled_postamble(locals); end
  def precompiled_template(locals); end
  def prepare; end
end

# CSV Template implementation. See:
# http://ruby-doc.org/stdlib/libdoc/csv/rdoc/CSV.html
#
# == Example
#
#    # Example of csv template
#    tpl = <<-EOS
#      # header
#      csv << ['NAME', 'ID']
#
#      # data rows
#      @people.each do |person|
#        csv << [person[:name], person[:id]]
#      end
#    EOS
#
#    @people = [
#      {:name => "Joshua Peek", :id => 1},
#      {:name => "Ryan Tomayko", :id => 2},
#      {:name => "Simone Carletti", :id => 3}
#    ]
#
#    template = Tilt::CSVTemplate.new { tpl }
#    template.render(self)
class Tilt::CSVTemplate < ::Tilt::Template
  def precompiled(locals); end
  def precompiled_template(locals); end
  def prepare; end

  class << self
    def engine; end
  end
end

# Extremely simple template cache implementation. Calling applications
# create a Tilt::Cache instance and use #fetch with any set of hashable
# arguments (such as those to Tilt.new):
#
#     cache = Tilt::Cache.new
#     cache.fetch(path, line, options) { Tilt.new(path, line, options) }
#
# Subsequent invocations return the already loaded template object.
#
# @note Tilt::Cache is a thin wrapper around Hash.  It has the following
#   limitations:
#   * Not thread-safe.
#   * Size is unbounded.
#   * Keys are not copied defensively, and should not be modified after
#   being passed to #fetch.  More specifically, the values returned by
#   key#hash and key#eql? should not change.
#   If this is too limiting for you, use a different cache implementation.
class Tilt::Cache
  # @return [Cache] a new instance of Cache
  def initialize; end

  # Clears the cache.
  def clear; end

  # Caches a value for key, or returns the previously cached value.
  # If a value has been previously cached for key then it is
  # returned. Otherwise, block is yielded to and its return value
  # which may be nil, is cached under key and returned.
  #
  # @yield
  # @yieldreturn the value to cache for key
  def fetch(*key); end
end

module Tilt::CompiledTemplates; end

# Used for detecting autoloading bug in JRuby
class Tilt::Dummy; end

# ERB template implementation. See:
# http://www.ruby-doc.org/stdlib/libdoc/erb/rdoc/classes/ERB.html
class Tilt::ERBTemplate < ::Tilt::Template
  def precompiled(locals); end
  def precompiled_postamble(locals); end
  def precompiled_preamble(locals); end
  def precompiled_template(locals); end
  def prepare; end

  class << self
    def default_output_variable; end
    def default_output_variable=(name); end
  end
end

Tilt::ERBTemplate::SUPPORTS_KVARGS = T.let(T.unsafe(nil), Array)

# Erubi (a simplified version of Erubis) template implementation.
# See https://github.com/jeremyevans/erubi
#
# ErubiTemplate supports the following additional options, in addition
# to the options supported by the Erubi engine:
#
# :engine_class :: allows you to specify a custom engine class to use
#                  instead of the default (which is ::Erubi::Engine).
class Tilt::ErubiTemplate < ::Tilt::Template
  def precompiled_template(locals); end
  def prepare; end
end

class Tilt::EtanniTemplate < ::Tilt::Template
  def precompiled(locals); end
  def precompiled_template(locals); end
  def prepare; end
end

# Kramdown Markdown implementation. See:
# http://kramdown.rubyforge.org/
class Tilt::KramdownTemplate < ::Tilt::Template
  # @return [Boolean]
  def allows_script?; end

  def evaluate(scope, locals, &block); end
  def prepare; end
end

Tilt::KramdownTemplate::DUMB_QUOTES = T.let(T.unsafe(nil), Array)

# @private
Tilt::LOCK = T.let(T.unsafe(nil), Thread::Mutex)

# Tilt::Mapping associates file extensions with template implementations.
#
#     mapping = Tilt::Mapping.new
#     mapping.register(Tilt::RDocTemplate, 'rdoc')
#     mapping['index.rdoc'] # => Tilt::RDocTemplate
#     mapping.new('index.rdoc').render
#
# You can use {#register} to register a template class by file
# extension, {#registered?} to see if a file extension is mapped,
# {#[]} to lookup template classes, and {#new} to instantiate template
# objects.
#
# Mapping also supports *lazy* template implementations. Note that regularly
# registered template implementations *always* have preference over lazily
# registered template implementations. You should use {#register} if you
# depend on a specific template implementation and {#register_lazy} if there
# are multiple alternatives.
#
#     mapping = Tilt::Mapping.new
#     mapping.register_lazy('RDiscount::Template', 'rdiscount/template', 'md')
#     mapping['index.md']
#     # => RDiscount::Template
#
# {#register_lazy} takes a class name, a filename, and a list of file
# extensions. When you try to lookup a template name that matches the
# file extension, Tilt will automatically try to require the filename and
# constantize the class name.
#
# Unlike {#register}, there can be multiple template implementations
# registered lazily to the same file extension. Tilt will attempt to load the
# template implementations in order (registered *last* would be tried first),
# returning the first which doesn't raise LoadError.
#
# If all of the registered template implementations fails, Tilt will raise
# the exception of the first, since that was the most preferred one.
#
#     mapping = Tilt::Mapping.new
#     mapping.register_lazy('Bluecloth::Template', 'bluecloth/template', 'md')
#     mapping.register_lazy('RDiscount::Template', 'rdiscount/template', 'md')
#     mapping['index.md']
#     # => RDiscount::Template
#
# In the previous example we say that RDiscount has a *higher priority* than
# BlueCloth. Tilt will first try to `require "rdiscount/template"`, falling
# back to `require "bluecloth/template"`. If none of these are successful,
# the first error will be raised.
class Tilt::Mapping
  # @return [Mapping] a new instance of Mapping
  def initialize; end

  # Looks up a template class based on file name and/or extension.
  #
  # @example
  #   mapping['views/hello.erb'] # => Tilt::ERBTemplate
  #   mapping['hello.erb']       # => Tilt::ERBTemplate
  #   mapping['erb']             # => Tilt::ERBTemplate
  # @return [template class]
  def [](file); end

  # Finds the extensions the template class has been registered under.
  #
  # @param template_class [template class]
  def extensions_for(template_class); end

  # @private
  def lazy_map; end

  # Instantiates a new template class based on the file.
  #
  # @example
  #   mapping.new('index.mt') # => instance of MyEngine::Template
  # @raise [RuntimeError] if there is no template class registered for the
  #   file name.
  # @see Tilt::Template.new
  def new(file, line = T.unsafe(nil), options = T.unsafe(nil), &block); end

  # Registers a template implementation by file extension. There can only be
  # one template implementation per file extension, and this method will
  # override any existing mapping.
  #
  # @example
  #   mapping.register MyEngine::Template, 'mt'
  #   mapping['index.mt'] # => MyEngine::Template
  # @param template_class
  # @param extensions [Array<String>] List of extensions.
  # @return [void]
  def register(template_class, *extensions); end

  # Registers a lazy template implementation by file extension. You
  # can have multiple lazy template implementations defined on the
  # same file extension, in which case the template implementation
  # defined *last* will be attempted loaded *first*.
  #
  # @example
  #   mapping.register_lazy 'MyEngine::Template', 'my_engine/template',  'mt'
  #
  #   defined?(MyEngine::Template) # => false
  #   mapping['index.mt'] # => MyEngine::Template
  #   defined?(MyEngine::Template) # => true
  # @param class_name [String] Class name of a template class.
  # @param file [String] Filename where the template class is defined.
  # @param extensions [Array<String>] List of extensions.
  # @return [void]
  def register_lazy(class_name, file, *extensions); end

  # Checks if a file extension is registered (either eagerly or
  # lazily) in this mapping.
  #
  # @example
  #   mapping.registered?('erb')  # => true
  #   mapping.registered?('nope') # => false
  # @param ext [String] File extension.
  # @return [Boolean]
  def registered?(ext); end

  # Looks up a template class based on file name and/or extension.
  #
  # @example
  #   mapping['views/hello.erb'] # => Tilt::ERBTemplate
  #   mapping['hello.erb']       # => Tilt::ERBTemplate
  #   mapping['erb']             # => Tilt::ERBTemplate
  # @return [template class]
  def template_for(file); end

  # @private
  def template_map; end

  # Looks up a list of template classes based on file name. If the file name
  # has multiple extensions, it will return all template classes matching the
  # extensions from the end.
  #
  # @example
  #   mapping.templates_for('views/index.haml.erb')
  #   # => [Tilt::ERBTemplate, Tilt::HamlTemplate]
  # @return [Array<template class>]
  def templates_for(file); end

  private

  # The proper behavior (in MRI) for autoload? is to
  # return `false` when the constant/file has been
  # explicitly required.
  #
  # However, in JRuby it returns `true` even after it's
  # been required. In that case it turns out that `defined?`
  # returns `"constant"` if it exists and `nil` when it doesn't.
  # This is actually a second bug: `defined?` should resolve
  # autoload (aka. actually try to require the file).
  #
  # We use the second bug in order to resolve the first bug.
  #
  # @return [Boolean]
  def constant_defined?(name); end

  # @private
  def initialize_copy(other); end

  # @return [Boolean]
  def lazy?(ext); end

  def lazy_load(pattern); end
  def lookup(ext); end
  def split(file); end
end

Tilt::Mapping::LOCK = T.let(T.unsafe(nil), Monitor)

# Nokogiri template implementation. See:
# http://nokogiri.org/
class Tilt::NokogiriTemplate < ::Tilt::Template
  def evaluate(scope, locals); end
  def precompiled_postamble(locals); end
  def precompiled_preamble(locals); end
  def precompiled_template(locals); end
  def prepare; end
end

Tilt::NokogiriTemplate::DOCUMENT_HEADER = T.let(T.unsafe(nil), Regexp)

# Raw text (no template functionality).
class Tilt::PlainTemplate < ::Tilt::Template
  def evaluate(scope, locals, &block); end
  def prepare; end
end

# RDoc template. See:
# http://rdoc.rubyforge.org/
#
# It's suggested that your program `require 'rdoc/markup'` and
# `require 'rdoc/markup/to_html'` at load time when using this template
# engine in a threaded environment.
class Tilt::RDocTemplate < ::Tilt::Template
  # @return [Boolean]
  def allows_script?; end

  def evaluate(scope, locals, &block); end
  def markup; end
  def prepare; end
end

# Sass template implementation. See:
# http://haml.hamptoncatlin.com/
#
# Sass templates do not support object scopes, locals, or yield.
class Tilt::SassTemplate < ::Tilt::Template
  # @return [Boolean]
  def allows_script?; end

  def evaluate(scope, locals, &block); end
  def prepare; end

  private

  def sass_options; end
end

Tilt::SassTemplate::Sass = SassC

# Sass's new .scss type template implementation.
class Tilt::ScssTemplate < ::Tilt::SassTemplate
  private

  def sass_options; end
end

# Standalone string interpolator and template processor implementation in Go.
# see: https://github.com/gliderlabs/sigil
class Tilt::SigilTemplate < ::Tilt::Template
  # @return [Boolean]
  def allows_script?; end

  def evaluate(scope, locals, &block); end
  def prepare; end
end

# The template source is evaluated as a Ruby string. The #{} interpolation
# syntax can be used to generated dynamic output.
class Tilt::StringTemplate < ::Tilt::Template
  def precompiled(locals); end
  def precompiled_template(locals); end
  def prepare; end
end

# @private
Tilt::TOPOBJECT = Tilt::CompiledTemplates

# Base class for template implementations. Subclasses must implement
# the #prepare method and one of the #evaluate or #precompiled_template
# methods.
class Tilt::Template
  # Create a new template with the file, line, and options specified. By
  # default, template data is read from the file. When a block is given,
  # it should read template data and return as a String. When file is nil,
  # a block is required.
  #
  # All arguments are optional.
  #
  # @raise [ArgumentError]
  # @return [Template] a new instance of Template
  def initialize(file = T.unsafe(nil), line = T.unsafe(nil), options = T.unsafe(nil), &block); end

  # The basename of the template file.
  def basename(suffix = T.unsafe(nil)); end

  # Template source; loaded from a file or given directly.
  def data; end

  # The filename used in backtraces to describe the template.
  def eval_file; end

  # The name of the file where the template data was loaded from.
  def file; end

  # The line number in #file where template data was loaded from.
  def line; end

  # An empty Hash that the template engine can populate with various
  # metadata.
  def metadata; end

  # The template file's basename with all extensions chomped off.
  def name; end

  # A Hash of template engine specific options. This is passed directly
  # to the underlying engine and is not used by the generic template
  # interface.
  def options; end

  # Render the template in the given scope with the locals specified. If a
  # block is given, it is typically available within the template via
  # +yield+.
  def render(scope = T.unsafe(nil), locals = T.unsafe(nil), &block); end

  protected

  # The encoding of the source data. Defaults to the
  # default_encoding-option if present. You may override this method
  # in your template class if you have a better hint of the data's
  # encoding.
  def default_encoding; end

  # Execute the compiled template and return the result string. Template
  # evaluation is guaranteed to be performed in the scope object with the
  # locals specified and with support for yielding to the block.
  #
  # This method is only used by source generating templates. Subclasses that
  # override render() may not support all features.
  def evaluate(scope, locals, &block); end

  # Generates all template source by combining the preamble, template, and
  # postamble and returns a two-tuple of the form: [source, offset], where
  # source is the string containing (Ruby) source code for the template and
  # offset is the integer line offset where line reporting should begin.
  #
  # Template subclasses may override this method when they need complete
  # control over source generation or want to adjust the default line
  # offset. In most cases, overriding the #precompiled_template method is
  # easier and more appropriate.
  def precompiled(local_keys); end

  def precompiled_postamble(local_keys); end
  def precompiled_preamble(local_keys); end

  # A string containing the (Ruby) source code for the template. The
  # default Template#evaluate implementation requires either this
  # method or the #precompiled method be overridden. When defined,
  # the base Template guarantees correct file/line handling, locals
  # support, custom scopes, proper encoding, and support for template
  # compilation.
  #
  # @raise [NotImplementedError]
  def precompiled_template(local_keys); end

  # Do whatever preparation is necessary to setup the underlying template
  # engine. Called immediately after template data is loaded. Instance
  # variables set in this method are available when #evaluate is called.
  #
  # Subclasses must provide an implementation of this method.
  #
  # @raise [NotImplementedError]
  def prepare; end

  private

  def binary(string); end
  def compile_template_method(local_keys, scope_class = T.unsafe(nil)); end

  # The compiled method for the locals keys provided.
  def compiled_method(locals_keys, scope_class = T.unsafe(nil)); end

  def extract_encoding(script); end
  def extract_magic_comment(script); end
  def local_extraction(local_keys); end
  def read_template_file; end
  def unbind_compiled_method(method_name); end

  class << self
    # @deprecated Use `.metadata[:mime_type]` instead.
    def default_mime_type; end

    # @deprecated Use `.metadata[:mime_type] = val` instead.
    def default_mime_type=(value); end

    # An empty Hash that the template engine can populate with various
    # metadata.
    def metadata; end
  end
end

# Current version.
Tilt::VERSION = T.let(T.unsafe(nil), String)
