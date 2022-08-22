# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `erb-formatter` gem.
# Please instead update this file by running `bin/tapioca gem erb-formatter`.

class ERB::Formatter
  # @return [Formatter] a new instance of Formatter
  def initialize(source, line_width: T.unsafe(nil), filename: T.unsafe(nil), debug: T.unsafe(nil)); end

  # Returns the value of attribute erb_tags.
  def erb_tags; end

  # Sets the attribute erb_tags
  #
  # @param value the value to set the attribute erb_tags to.
  def erb_tags=(_arg0); end

  # Returns the value of attribute erb_tags_regexp.
  def erb_tags_regexp; end

  # Sets the attribute erb_tags_regexp
  #
  # @param value the value to set the attribute erb_tags_regexp to.
  def erb_tags_regexp=(_arg0); end

  def format; end
  def format_attributes(tag_name, attrs, tag_closing); end
  def format_code_with_rubocop(code, line_width); end
  def format_erb_attributes(string); end
  def format_erb_tags(string); end
  def format_ruby(code, autoclose: T.unsafe(nil)); end
  def format_text(text); end

  # Returns the value of attribute html.
  def html; end

  # Sets the attribute html
  #
  # @param value the value to set the attribute html to.
  def html=(_arg0); end

  def indented(string); end

  # Returns the value of attribute line_width.
  def line_width; end

  # Sets the attribute line_width
  #
  # @param value the value to set the attribute line_width to.
  def line_width=(_arg0); end

  # Returns the value of attribute pre_placeholders.
  def pre_placeholders; end

  # Sets the attribute pre_placeholders
  #
  # @param value the value to set the attribute pre_placeholders to.
  def pre_placeholders=(_arg0); end

  # Returns the value of attribute pre_placeholders_regexp.
  def pre_placeholders_regexp; end

  # Sets the attribute pre_placeholders_regexp
  #
  # @param value the value to set the attribute pre_placeholders_regexp to.
  def pre_placeholders_regexp=(_arg0); end

  # Returns the value of attribute pre_pos.
  def pre_pos; end

  # Sets the attribute pre_pos
  #
  # @param value the value to set the attribute pre_pos to.
  def pre_pos=(_arg0); end

  def raise(message); end

  # Returns the value of attribute source.
  def source; end

  # Sets the attribute source
  #
  # @param value the value to set the attribute source to.
  def source=(_arg0); end

  # Returns the value of attribute tag_stack.
  def tag_stack; end

  # Sets the attribute tag_stack
  #
  # @param value the value to set the attribute tag_stack to.
  def tag_stack=(_arg0); end

  def tag_stack_pop(tag_name, code); end
  def tag_stack_push(tag_name, code); end

  # Returns the value of attribute tags_regexp.
  def tags_regexp; end

  # Sets the attribute tags_regexp
  #
  # @param value the value to set the attribute tags_regexp to.
  def tags_regexp=(_arg0); end

  # Returns the value of attribute html.
  def to_s; end

  class << self
    def format(source, filename: T.unsafe(nil)); end
  end
end

ERB::Formatter::ATTR = T.let(T.unsafe(nil), Regexp)

# https://stackoverflow.com/a/317081
ERB::Formatter::ATTR_NAME = T.let(T.unsafe(nil), Regexp)

ERB::Formatter::BAD_ATTR = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::DOUBLE_QUOTE_ATTR = T.let(T.unsafe(nil), Regexp)

module ERB::Formatter::DebugShovel
  def <<(string); end
end

ERB::Formatter::ERB_ELSE = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::ERB_END = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::ERB_OPEN_BLOCK = T.let(T.unsafe(nil), Proc)
ERB::Formatter::ERB_PLACEHOLDER = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::ERB_TAG = T.let(T.unsafe(nil), Regexp)
class ERB::Formatter::Error < ::StandardError; end
ERB::Formatter::HTML_ATTR = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::HTML_TAG_CLOSE = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::HTML_TAG_OPEN = T.let(T.unsafe(nil), Regexp)

class ERB::Formatter::IgnoreList
  # @return [IgnoreList] a new instance of IgnoreList
  def initialize(contents: T.unsafe(nil), base_dir: T.unsafe(nil)); end

  # @return [Boolean]
  def should_ignore_file?(path); end
end

ERB::Formatter::MULTILINE_ATTR_NAMES = T.let(T.unsafe(nil), Array)
ERB::Formatter::QUOTED_ATTR = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::RUBOCOP_STDIN_MARKER = T.let(T.unsafe(nil), String)

# Override the max line length to account from already indented ERB
module ERB::Formatter::RubocopForcedMaxLineLength
  def max; end
end

ERB::Formatter::SELF_CLOSING_TAG = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::SINGLE_QUOTE_ATTR = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::TAG_NAME = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::TAG_NAME_ONLY = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::UNQUOTED_ATTR = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::UNQUOTED_VALUE = T.let(T.unsafe(nil), Regexp)
ERB::Formatter::VERSION = T.let(T.unsafe(nil), String)
