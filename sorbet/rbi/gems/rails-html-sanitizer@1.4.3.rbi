# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rails-html-sanitizer` gem.
# Please instead update this file by running `bin/tapioca gem rails-html-sanitizer`.

module ActionView
  class << self
    def eager_load!; end

    # Returns the currently loaded version of Action View as a <tt>Gem::Version</tt>.
    def gem_version; end

    # Returns the currently loaded version of Action View as a <tt>Gem::Version</tt>.
    def version; end
  end
end

ActionView::ENCODING_FLAG = T.let(T.unsafe(nil), String)

module ActionView::Helpers
  include ::ActionView::Helpers::SanitizeHelper
  include ::ActionView::Helpers::TextHelper
  include ::ActionView::Helpers::UrlHelper
  include ::ActionView::Helpers::SanitizeHelper
  include ::ActionView::Helpers::TextHelper
  include ::ActionView::Helpers::FormTagHelper
  include ::ActionView::Helpers::FormHelper
  include ::ActionView::Helpers::TranslationHelper

  mixes_in_class_methods ::ActionView::Helpers::UrlHelper::ClassMethods
  mixes_in_class_methods ::ActionView::Helpers::SanitizeHelper::ClassMethods

  class << self
    def eager_load!; end
  end
end

# The SanitizeHelper module provides a set of methods for scrubbing text of undesired HTML elements.
# These helper methods extend Action View making them callable within your template files.
module ActionView::Helpers::SanitizeHelper
  mixes_in_class_methods ::ActionView::Helpers::SanitizeHelper::ClassMethods

  # Sanitizes HTML input, stripping all but known-safe tags and attributes.
  #
  # It also strips href/src attributes with unsafe protocols like
  # <tt>javascript:</tt>, while also protecting against attempts to use Unicode,
  # ASCII, and hex character references to work around these protocol filters.
  # All special characters will be escaped.
  #
  # The default sanitizer is Rails::Html::SafeListSanitizer. See {Rails HTML
  # Sanitizers}[https://github.com/rails/rails-html-sanitizer] for more information.
  #
  # Custom sanitization rules can also be provided.
  #
  # Please note that sanitizing user-provided text does not guarantee that the
  # resulting markup is valid or even well-formed.
  #
  # ==== Options
  #
  # * <tt>:tags</tt> - An array of allowed tags.
  # * <tt>:attributes</tt> - An array of allowed attributes.
  # * <tt>:scrubber</tt> - A {Rails::Html scrubber}[https://github.com/rails/rails-html-sanitizer]
  #   or {Loofah::Scrubber}[https://github.com/flavorjones/loofah] object that
  #   defines custom sanitization rules. A custom scrubber takes precedence over
  #   custom tags and attributes.
  #
  # ==== Examples
  #
  # Normal use:
  #
  #   <%= sanitize @comment.body %>
  #
  # Providing custom lists of permitted tags and attributes:
  #
  #   <%= sanitize @comment.body, tags: %w(strong em a), attributes: %w(href) %>
  #
  # Providing a custom Rails::Html scrubber:
  #
  #   class CommentScrubber < Rails::Html::PermitScrubber
  #     def initialize
  #       super
  #       self.tags = %w( form script comment blockquote )
  #       self.attributes = %w( style )
  #     end
  #
  #     def skip_node?(node)
  #       node.text?
  #     end
  #   end
  #
  #   <%= sanitize @comment.body, scrubber: CommentScrubber.new %>
  #
  # See {Rails HTML Sanitizer}[https://github.com/rails/rails-html-sanitizer] for
  # documentation about Rails::Html scrubbers.
  #
  # Providing a custom Loofah::Scrubber:
  #
  #   scrubber = Loofah::Scrubber.new do |node|
  #     node.remove if node.name == 'script'
  #   end
  #
  #   <%= sanitize @comment.body, scrubber: scrubber %>
  #
  # See {Loofah's documentation}[https://github.com/flavorjones/loofah] for more
  # information about defining custom Loofah::Scrubber objects.
  #
  # To set the default allowed tags or attributes across your application:
  #
  #   # In config/application.rb
  #   config.action_view.sanitized_allowed_tags = ['strong', 'em', 'a']
  #   config.action_view.sanitized_allowed_attributes = ['href', 'title']
  def sanitize(html, options = T.unsafe(nil)); end

  # Sanitizes a block of CSS code. Used by +sanitize+ when it comes across a style attribute.
  def sanitize_css(style); end

  # Strips all link tags from +html+ leaving just the link text.
  #
  #   strip_links('<a href="http://www.rubyonrails.org">Ruby on Rails</a>')
  #   # => Ruby on Rails
  #
  #   strip_links('Please e-mail me at <a href="mailto:me@email.com">me@email.com</a>.')
  #   # => Please e-mail me at me@email.com.
  #
  #   strip_links('Blog: <a href="http://www.myblog.com/" class="nav" target=\"_blank\">Visit</a>.')
  #   # => Blog: Visit.
  #
  #   strip_links('<<a href="https://example.org">malformed & link</a>')
  #   # => &lt;malformed &amp; link
  def strip_links(html); end

  # Strips all HTML tags from +html+, including comments and special characters.
  #
  #   strip_tags("Strip <i>these</i> tags!")
  #   # => Strip these tags!
  #
  #   strip_tags("<b>Bold</b> no more!  <a href='more.html'>See more here</a>...")
  #   # => Bold no more!  See more here...
  #
  #   strip_tags("<div id='top-bar'>Welcome to my website!</div>")
  #   # => Welcome to my website!
  #
  #   strip_tags("> A quote from Smith & Wesson")
  #   # => &gt; A quote from Smith &amp; Wesson
  def strip_tags(html); end
end

module ActionView::Helpers::SanitizeHelper::ClassMethods
  # Gets the Rails::Html::FullSanitizer instance used by +strip_tags+. Replace with
  # any object that responds to +sanitize+.
  #
  #   class Application < Rails::Application
  #     config.action_view.full_sanitizer = MySpecialSanitizer.new
  #   end
  def full_sanitizer; end

  # Sets the attribute full_sanitizer
  #
  # @param value the value to set the attribute full_sanitizer to.
  def full_sanitizer=(_arg0); end

  # Gets the Rails::Html::LinkSanitizer instance used by +strip_links+.
  # Replace with any object that responds to +sanitize+.
  #
  #   class Application < Rails::Application
  #     config.action_view.link_sanitizer = MySpecialSanitizer.new
  #   end
  def link_sanitizer; end

  # Sets the attribute link_sanitizer
  #
  # @param value the value to set the attribute link_sanitizer to.
  def link_sanitizer=(_arg0); end

  # Gets the Rails::Html::SafeListSanitizer instance used by sanitize and +sanitize_css+.
  # Replace with any object that responds to +sanitize+.
  #
  #   class Application < Rails::Application
  #     config.action_view.safe_list_sanitizer = MySpecialSanitizer.new
  #   end
  def safe_list_sanitizer; end

  # Sets the attribute safe_list_sanitizer
  #
  # @param value the value to set the attribute safe_list_sanitizer to.
  def safe_list_sanitizer=(_arg0); end

  def sanitized_allowed_attributes; end

  # Replaces the allowed HTML attributes for the +sanitize+ helper.
  #
  #   class Application < Rails::Application
  #     config.action_view.sanitized_allowed_attributes = ['onclick', 'longdesc']
  #   end
  def sanitized_allowed_attributes=(attributes); end

  def sanitized_allowed_css_keywords; end
  def sanitized_allowed_css_keywords=(_); end
  def sanitized_allowed_css_properties; end
  def sanitized_allowed_css_properties=(_); end
  def sanitized_allowed_protocols; end
  def sanitized_allowed_protocols=(_); end
  def sanitized_allowed_tags; end

  # Replaces the allowed tags for the +sanitize+ helper.
  #
  #   class Application < Rails::Application
  #     config.action_view.sanitized_allowed_tags = 'table', 'tr', 'td'
  #   end
  def sanitized_allowed_tags=(tags); end

  def sanitized_bad_tags; end
  def sanitized_bad_tags=(_); end
  def sanitized_protocol_separator; end
  def sanitized_protocol_separator=(_); end
  def sanitized_shorthand_css_properties; end
  def sanitized_shorthand_css_properties=(_); end
  def sanitized_uri_attributes; end
  def sanitized_uri_attributes=(_); end
  def sanitizer_vendor; end

  private

  def deprecate_option(name); end
end

ActionView::TemplateError = ActionView::Template::Error

module Rails
  class << self
    def app_class; end
    def app_class=(_arg0); end
    def application; end
    def application=(_arg0); end
    def autoloaders; end
    def backtrace_cleaner; end
    def cache; end
    def cache=(_arg0); end
    def configuration; end
    def env; end
    def env=(environment); end
    def error; end
    def gem_version; end
    def groups(*groups); end
    def initialize!(*_arg0, **_arg1, &_arg2); end
    def initialized?(*_arg0, **_arg1, &_arg2); end
    def logger; end
    def logger=(_arg0); end
    def public_path; end
    def root; end
    def version; end
  end
end

module Rails::Html; end

# === Rails::Html::FullSanitizer
# Removes all tags but strips out scripts, forms and comments.
#
# full_sanitizer = Rails::Html::FullSanitizer.new
# full_sanitizer.sanitize("<b>Bold</b> no more!  <a href='more.html'>See more here</a>...")
# # => Bold no more!  See more here...
class Rails::Html::FullSanitizer < ::Rails::Html::Sanitizer
  def sanitize(html, options = T.unsafe(nil)); end
end

# === Rails::Html::LinkSanitizer
# Removes +a+ tags and +href+ attributes leaving only the link text.
#
#  link_sanitizer = Rails::Html::LinkSanitizer.new
#  link_sanitizer.sanitize('<a href="example.com">Only the link text will be kept.</a>')
#
#  => 'Only the link text will be kept.'
class Rails::Html::LinkSanitizer < ::Rails::Html::Sanitizer
  # @return [LinkSanitizer] a new instance of LinkSanitizer
  def initialize; end

  def sanitize(html, options = T.unsafe(nil)); end
end

# === Rails::Html::PermitScrubber
#
# +Rails::Html::PermitScrubber+ allows you to permit only your own tags and/or attributes.
#
# +Rails::Html::PermitScrubber+ can be subclassed to determine:
# - When a node should be skipped via +skip_node?+.
# - When a node is allowed via +allowed_node?+.
# - When an attribute should be scrubbed via +scrub_attribute?+.
#
# Subclasses don't need to worry if tags or attributes are set or not.
# If tags or attributes are not set, Loofah's behavior will be used.
# If you override +allowed_node?+ and no tags are set, it will not be called.
# Instead Loofahs behavior will be used.
# Likewise for +scrub_attribute?+ and attributes respectively.
#
# Text and CDATA nodes are skipped by default.
# Unallowed elements will be stripped, i.e. element is removed but its subtree kept.
# Supplied tags and attributes should be Enumerables.
#
# +tags=+
# If set, elements excluded will be stripped.
# If not, elements are stripped based on Loofahs +HTML5::Scrub.allowed_element?+.
#
# +attributes=+
# If set, attributes excluded will be removed.
# If not, attributes are removed based on Loofahs +HTML5::Scrub.scrub_attributes+.
#
#  class CommentScrubber < Html::PermitScrubber
#    def initialize
#      super
#      self.tags = %w(form script comment blockquote)
#    end
#
#    def skip_node?(node)
#      node.text?
#    end
#
#    def scrub_attribute?(name)
#      name == "style"
#    end
#  end
#
# See the documentation for +Nokogiri::XML::Node+ to understand what's possible
# with nodes: https://nokogiri.org/rdoc/Nokogiri/XML/Node.html
class Rails::Html::PermitScrubber < ::Loofah::Scrubber
  # @return [PermitScrubber] a new instance of PermitScrubber
  def initialize; end

  # Returns the value of attribute attributes.
  def attributes; end

  def attributes=(attributes); end
  def scrub(node); end

  # Returns the value of attribute tags.
  def tags; end

  def tags=(tags); end

  protected

  # @return [Boolean]
  def allowed_node?(node); end

  # @return [Boolean]
  def keep_node?(node); end

  def scrub_attribute(node, attr_node); end

  # @return [Boolean]
  def scrub_attribute?(name); end

  def scrub_attributes(node); end
  def scrub_css_attribute(node); end
  def scrub_node(node); end

  # @return [Boolean]
  def skip_node?(node); end

  def validate!(var, name); end
end

# === Rails::Html::SafeListSanitizer
# Sanitizes html and css from an extensive safe list (see link further down).
#
# === Whitespace
# We can't make any guarantees about whitespace being kept or stripped.
# Loofah uses Nokogiri, which wraps either a C or Java parser for the
# respective Ruby implementation.
# Those two parsers determine how whitespace is ultimately handled.
#
# When the stripped markup will be rendered the users browser won't take
# whitespace into account anyway. It might be better to suggest your users
# wrap their whitespace sensitive content in pre tags or that you do
# so automatically.
#
# === Options
# Sanitizes both html and css via the safe lists found here:
# https://github.com/flavorjones/loofah/blob/master/lib/loofah/html5/safelist.rb
#
# SafeListSanitizer also accepts options to configure
# the safe list used when sanitizing html.
# There's a class level option:
# Rails::Html::SafeListSanitizer.allowed_tags = %w(table tr td)
# Rails::Html::SafeListSanitizer.allowed_attributes = %w(id class style)
#
# Tags and attributes can also be passed to +sanitize+.
# Passed options take precedence over the class level options.
#
# === Examples
# safe_list_sanitizer = Rails::Html::SafeListSanitizer.new
#
# Sanitize css doesn't take options
# safe_list_sanitizer.sanitize_css('background-color: #000;')
#
# Default: sanitize via a extensive safe list of allowed elements
# safe_list_sanitizer.sanitize(@article.body)
#
# Safe list via the supplied tags and attributes
# safe_list_sanitizer.sanitize(@article.body, tags: %w(table tr td),
# attributes: %w(id class style))
#
# Safe list via a custom scrubber
# safe_list_sanitizer.sanitize(@article.body, scrubber: ArticleScrubber.new)
class Rails::Html::SafeListSanitizer < ::Rails::Html::Sanitizer
  # @return [SafeListSanitizer] a new instance of SafeListSanitizer
  def initialize; end

  def sanitize(html, options = T.unsafe(nil)); end
  def sanitize_css(style_string); end

  private

  def allowed_attributes(options); end
  def allowed_tags(options); end

  # @return [Boolean]
  def loofah_using_html5?; end

  def remove_safelist_tag_combinations(tags); end

  class << self
    # Returns the value of attribute allowed_attributes.
    def allowed_attributes; end

    # Sets the attribute allowed_attributes
    #
    # @param value the value to set the attribute allowed_attributes to.
    def allowed_attributes=(_arg0); end

    # Returns the value of attribute allowed_tags.
    def allowed_tags; end

    # Sets the attribute allowed_tags
    #
    # @param value the value to set the attribute allowed_tags to.
    def allowed_tags=(_arg0); end
  end
end

class Rails::Html::Sanitizer
  # @raise [NotImplementedError]
  def sanitize(html, options = T.unsafe(nil)); end

  private

  def properly_encode(fragment, options); end
  def remove_xpaths(node, xpaths); end

  class << self
    def full_sanitizer; end
    def link_sanitizer; end
    def safe_list_sanitizer; end
    def white_list_sanitizer; end
  end
end

Rails::Html::Sanitizer::VERSION = T.let(T.unsafe(nil), String)

# === Rails::Html::TargetScrubber
#
# Where +Rails::Html::PermitScrubber+ picks out tags and attributes to permit in
# sanitization, +Rails::Html::TargetScrubber+ targets them for removal.
#
# +tags=+
# If set, elements included will be stripped.
#
# +attributes=+
# If set, attributes included will be removed.
class Rails::Html::TargetScrubber < ::Rails::Html::PermitScrubber
  # @return [Boolean]
  def allowed_node?(node); end

  # @return [Boolean]
  def scrub_attribute?(name); end
end

# === Rails::Html::TextOnlyScrubber
#
# +Rails::Html::TextOnlyScrubber+ allows you to permit text nodes.
#
# Unallowed elements will be stripped, i.e. element is removed but its subtree kept.
class Rails::Html::TextOnlyScrubber < ::Loofah::Scrubber
  # @return [TextOnlyScrubber] a new instance of TextOnlyScrubber
  def initialize; end

  def scrub(node); end
end

Rails::Html::WhiteListSanitizer = Rails::Html::SafeListSanitizer
Rails::Html::XPATHS_TO_REMOVE = T.let(T.unsafe(nil), Array)
