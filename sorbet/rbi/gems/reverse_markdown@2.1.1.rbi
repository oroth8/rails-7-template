# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `reverse_markdown` gem.
# Please instead update this file by running `bin/tapioca gem reverse_markdown`.

module ReverseMarkdown
  class << self
    def cleaner; end

    # @yield [@config]
    def config; end

    def convert(input, options = T.unsafe(nil)); end
  end
end

class ReverseMarkdown::Cleaner
  def clean_punctuation_characters(string); end

  # Find non-asterisk content that is enclosed by two or
  # more asterisks. Ensure that only one whitespace occurs
  # in the border area.
  # Same for underscores and brackets.
  def clean_tag_borders(string); end

  def force_encoding(string); end
  def remove_inner_whitespaces(string); end
  def remove_leading_newlines(string); end
  def remove_newlines(string); end
  def tidy(string); end

  private

  def present_or_default(string, default); end
  def preserve_border_whitespaces(string, options = T.unsafe(nil), &block); end
end

class ReverseMarkdown::Config
  # @return [Config] a new instance of Config
  def initialize; end

  def force_encoding; end

  # Sets the attribute force_encoding
  #
  # @param value the value to set the attribute force_encoding to.
  def force_encoding=(_arg0); end

  def github_flavored; end

  # Sets the attribute github_flavored
  #
  # @param value the value to set the attribute github_flavored to.
  def github_flavored=(_arg0); end

  def tag_border; end

  # Sets the attribute tag_border
  #
  # @param value the value to set the attribute tag_border to.
  def tag_border=(_arg0); end

  def unknown_tags; end

  # Sets the attribute unknown_tags
  #
  # @param value the value to set the attribute unknown_tags to.
  def unknown_tags=(_arg0); end

  def with(options = T.unsafe(nil)); end
end

module ReverseMarkdown::Converters
  class << self
    def default_converter(tag_name); end
    def lookup(tag_name); end
    def register(tag_name, converter); end
    def unregister(tag_name); end
  end
end

class ReverseMarkdown::Converters::A < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end

  private

  # @return [Boolean]
  def prepend_space?(node); end
end

class ReverseMarkdown::Converters::Base
  def escape_keychars(string); end
  def extract_title(node); end
  def treat(node, state); end
  def treat_children(node, state); end
end

class ReverseMarkdown::Converters::Blockquote < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Br < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Bypass < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Code < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Del < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end

  # @return [Boolean]
  def disabled?; end

  # @return [Boolean]
  def enabled?; end
end

class ReverseMarkdown::Converters::Details < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end

  # @return [Boolean]
  def disabled?; end

  # @return [Boolean]
  def enabled?; end
end

class ReverseMarkdown::Converters::Div < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Drop < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Em < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::FigCaption < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Figure < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::H < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Hr < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Ignore < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Img < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Li < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
  def indentation_from(state); end
  def prefix_for(node); end
end

class ReverseMarkdown::Converters::Ol < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::P < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::PassThrough < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Pre < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end

  private

  def language(node); end
  def language_from_confluence_class(node); end
  def language_from_highlight_class(node); end

  # Override #treat as proposed in https://github.com/xijo/reverse_markdown/pull/69
  def treat(node, state); end
end

class ReverseMarkdown::Converters::Strong < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Table < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Td < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end
end

class ReverseMarkdown::Converters::Text < ::ReverseMarkdown::Converters::Base
  def convert(node, options = T.unsafe(nil)); end

  private

  def preserve_keychars_within_backticks(text); end
  def preserve_nbsp(text); end
  def preserve_tags(text); end
  def remove_border_newlines(text); end
  def remove_inner_newlines(text); end
  def treat_empty(node); end
  def treat_text(node); end
end

class ReverseMarkdown::Converters::Tr < ::ReverseMarkdown::Converters::Base
  def convert(node, state = T.unsafe(nil)); end

  # @return [Boolean]
  def table_header_row?(node); end

  def underline_for(node); end
end

class ReverseMarkdown::Error < ::StandardError; end
class ReverseMarkdown::InvalidConfigurationError < ::ReverseMarkdown::Error; end
class ReverseMarkdown::UnknownTagError < ::ReverseMarkdown::Error; end
ReverseMarkdown::VERSION = T.let(T.unsafe(nil), String)
