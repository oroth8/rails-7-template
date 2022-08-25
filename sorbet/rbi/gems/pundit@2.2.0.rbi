# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `pundit` gem.
# Please instead update this file by running `bin/tapioca gem pundit`.

# @api public
module Pundit
  include ::Pundit::Authorization

  class << self
    # Retrieves the policy for the given record, initializing it with the
    # record and user and finally throwing an error if the user is not
    # authorized to perform the given action.
    #
    # @api public
    # @param user [Object] the user that initiated the action
    # @param possibly_namespaced_record [Object, Array] the object we're checking permissions of
    # @param query [Symbol, String] the predicate method to check on the policy (e.g. `:show?`)
    # @param cache [#[], #[]=] a Hash-like object to cache the found policy instance in
    # @param policy_class [Class] the policy class we want to force use of
    # @raise [NotAuthorizedError] if the given query method returned false
    # @return [Object] Always returns the passed object record
    def authorize(user, possibly_namespaced_record, query, policy_class: T.unsafe(nil), cache: T.unsafe(nil)); end

    # @api public
    # @private
    def included(base); end

    # Retrieves the policy for the given record.
    #
    # @api public
    # @param user [Object] the user that initiated the action
    # @param record [Object] the object we're retrieving the policy for
    # @raise [InvalidConstructorError] if the policy constructor called incorrectly
    # @return [Object, nil] instance of policy class with query methods
    # @see https://github.com/varvet/pundit#policies
    def policy(user, record); end

    # Retrieves the policy for the given record.
    #
    # @api public
    # @param user [Object] the user that initiated the action
    # @param record [Object] the object we're retrieving the policy for
    # @raise [NotDefinedError] if the policy cannot be found
    # @raise [InvalidConstructorError] if the policy constructor called incorrectly
    # @return [Object] instance of policy class with query methods
    # @see https://github.com/varvet/pundit#policies
    def policy!(user, record); end

    # Retrieves the policy scope for the given record.
    #
    # @api public
    # @param user [Object] the user that initiated the action
    # @param scope [Object] the object we're retrieving the policy scope for
    # @raise [InvalidConstructorError] if the policy constructor called incorrectly
    # @return [Scope{#resolve}, nil] instance of scope class which can resolve to a scope
    # @see https://github.com/varvet/pundit#scopes
    def policy_scope(user, scope); end

    # Retrieves the policy scope for the given record.
    #
    # @api public
    # @param user [Object] the user that initiated the action
    # @param scope [Object] the object we're retrieving the policy scope for
    # @raise [NotDefinedError] if the policy scope cannot be found
    # @raise [InvalidConstructorError] if the policy constructor called incorrectly
    # @return [Scope{#resolve}] instance of scope class which can resolve to a scope
    # @see https://github.com/varvet/pundit#scopes
    def policy_scope!(user, scope); end

    private

    # @api public
    def pundit_model(record); end
  end
end

module Pundit::Authorization
  extend ::ActiveSupport::Concern

  protected

  # Retrieves the policy for the given record, initializing it with the record
  # and current user and finally throwing an error if the user is not
  # authorized to perform the given action.
  #
  # @param record [Object, Array] the object we're checking permissions of
  # @param query [Symbol, String] the predicate method to check on the policy (e.g. `:show?`).
  #   If omitted then this defaults to the Rails controller action name.
  # @param policy_class [Class] the policy class we want to force use of
  # @raise [NotAuthorizedError] if the given query method returned false
  # @return [Object] Always returns the passed object record
  def authorize(record, query = T.unsafe(nil), policy_class: T.unsafe(nil)); end

  # Retrieves a set of permitted attributes from the policy by instantiating
  # the policy class for the given record and calling `permitted_attributes` on
  # it, or `permitted_attributes_for_{action}` if `action` is defined. It then infers
  # what key the record should have in the params hash and retrieves the
  # permitted attributes from the params hash under that key.
  #
  # @param record [Object] the object we're retrieving permitted attributes for
  # @param action [Symbol, String] the name of the action being performed on the record (e.g. `:update`).
  #   If omitted then this defaults to the Rails controller action name.
  # @return [Hash{String => Object}] the permitted attributes
  # @see https://github.com/varvet/pundit#strong-parameters
  def permitted_attributes(record, action = T.unsafe(nil)); end

  # Cache of policies. You should not rely on this method.
  #
  #
  # @api private
  def policies; end

  # Retrieves the policy for the given record.
  #
  # @param record [Object] the object we're retrieving the policy for
  # @return [Object, nil] instance of policy class with query methods
  # @see https://github.com/varvet/pundit#policies
  def policy(record); end

  # Retrieves the policy scope for the given record.
  #
  # @param scope [Object] the object we're retrieving the policy scope for
  # @param policy_scope_class [Class] the policy scope class we want to force use of
  # @return [Scope{#resolve}, nil] instance of scope class which can resolve to a scope
  # @see https://github.com/varvet/pundit#scopes
  def policy_scope(scope, policy_scope_class: T.unsafe(nil)); end

  # Cache of policy scope. You should not rely on this method.
  #
  #
  # @api private
  def policy_scopes; end

  # Retrieves the params for the given record.
  #
  # @param record [Object] the object we're retrieving params for
  # @return [ActionController::Parameters] the params
  def pundit_params_for(record); end

  # @return [Boolean] whether authorization has been performed, i.e. whether
  #   one {#authorize} or {#skip_authorization} has been called
  def pundit_policy_authorized?; end

  # @return [Boolean] whether policy scoping has been performed, i.e. whether
  #   one {#policy_scope} or {#skip_policy_scope} has been called
  def pundit_policy_scoped?; end

  # Hook method which allows customizing which user is passed to policies and
  # scopes initialized by {#authorize}, {#policy} and {#policy_scope}.
  #
  # @return [Object] the user object to be used with pundit
  # @see https://github.com/varvet/pundit#customize-pundit-user
  def pundit_user; end

  # Allow this action not to perform authorization.
  #
  # @return [void]
  # @see https://github.com/varvet/pundit#ensuring-policies-and-scopes-are-used
  def skip_authorization; end

  # Allow this action not to perform policy scoping.
  #
  # @return [void]
  # @see https://github.com/varvet/pundit#ensuring-policies-and-scopes-are-used
  def skip_policy_scope; end

  # Raises an error if authorization has not been performed, usually used as an
  # `after_action` filter to prevent programmer error in forgetting to call
  # {#authorize} or {#skip_authorization}.
  #
  # @raise [AuthorizationNotPerformedError] if authorization has not been performed
  # @return [void]
  # @see https://github.com/varvet/pundit#ensuring-policies-and-scopes-are-used
  def verify_authorized; end

  # Raises an error if policy scoping has not been performed, usually used as an
  # `after_action` filter to prevent programmer error in forgetting to call
  # {#policy_scope} or {#skip_policy_scope} in index actions.
  #
  # @raise [AuthorizationNotPerformedError] if policy scoping has not been performed
  # @return [void]
  # @see https://github.com/varvet/pundit#ensuring-policies-and-scopes-are-used
  def verify_policy_scoped; end

  private

  def pundit_policy_scope(scope); end
end

# Error that will be raised if a controller action has not called the
# `authorize` or `skip_authorization` methods.
#
# @api public
class Pundit::AuthorizationNotPerformedError < ::Pundit::Error; end

# To avoid name clashes with common Error naming when mixing in Pundit,
# keep it here with compact class style definition.
#
# @api private
class Pundit::Error < ::StandardError; end

# @api private
module Pundit::Generators; end

# @api private
module Pundit::Helper
  # @api private
  def policy_scope(scope); end
end

# Error that will be raised if a policy or policy scope constructor is not called correctly.
#
# @api public
class Pundit::InvalidConstructorError < ::Pundit::Error; end

# Error that will be raised when authorization has failed
#
# @api public
class Pundit::NotAuthorizedError < ::Pundit::Error
  # @api public
  # @return [NotAuthorizedError] a new instance of NotAuthorizedError
  def initialize(options = T.unsafe(nil)); end

  # @api public
  def policy; end

  # @api public
  def query; end

  # @api public
  def record; end
end

# Error that will be raised if a policy or policy scope is not defined.
#
# @api public
class Pundit::NotDefinedError < ::Pundit::Error; end

# Finds policy and scope classes for given object.
#
# @api public
# @example
#   user = User.find(params[:id])
#   finder = PolicyFinder.new(user)
#   finder.policy #=> UserPolicy
#   finder.scope #=> UserPolicy::Scope
class Pundit::PolicyFinder
  # @api public
  # @param object [any] the object to find policy and scope classes for
  # @return [PolicyFinder] a new instance of PolicyFinder
  def initialize(object); end

  # @api public
  def object; end

  # @api public
  # @return [String] the name of the key this object would have in a params hash
  def param_key; end

  # @api public
  # @example
  #   policy = finder.policy #=> UserPolicy
  #   policy.show? #=> true
  #   policy.update? #=> false
  # @return [nil, Class] policy class with query methods
  # @see https://github.com/varvet/pundit#policies
  def policy; end

  # @api public
  # @raise [NotDefinedError] if policy could not be determined
  # @return [Class] policy class with query methods
  def policy!; end

  # @api public
  # @example
  #   scope = finder.scope #=> UserPolicy::Scope
  #   scope.resolve #=> <#ActiveRecord::Relation ...>
  # @return [nil, Scope{#resolve}] scope class which can resolve to a scope
  # @see https://github.com/varvet/pundit#scopes
  def scope; end

  # @api public
  # @raise [NotDefinedError] if scope could not be determined
  # @return [Scope{#resolve}] scope class which can resolve to a scope
  def scope!; end

  private

  # @api public
  def find(subject); end

  # @api public
  def find_class_name(subject); end
end

# Error that will be raised if a controller action has not called the
# `policy_scope` or `skip_policy_scope` methods.
#
# @api public
class Pundit::PolicyScopingNotPerformedError < ::Pundit::AuthorizationNotPerformedError; end

# @api public
Pundit::SUFFIX = T.let(T.unsafe(nil), String)

Pundit::VERSION = T.let(T.unsafe(nil), String)
