# frozen_string_literal: true

FactoryBot.define do
  factory :json_base do
    skip_create
    initialize_with do
      new(attributes, json_reference_string, allowed_attributes)
    end

    transient do
      json_reference_string { nil }
      allowed_attributes { nil }
    end
  end
end

class JSONBase
  def initialize(args, json_reference_string, allowed_attributes)
    raise JSONBaseError, 'Missing json_reference_string' if json_reference_string.nil?

    @allowed_attributes = allowed_attributes || []
    @keys = JSON.parse(json_reference_string).keys.map(&:underscore)

    undefined_attributes = args.keys - keys.map(&:to_sym)
    raise JSONBaseError, "#{undefined_attributes} not defined in json_reference_string" if undefined_attributes.present?

    keys.each do |key|
      instance_variable_set("@#{key}", args.fetch(key.to_sym, nil))
    end
  end

  attr_reader :allowed_attributes, :keys

  def method_missing(method)
    return instance_variable_get("@#{method}") if respond_to_missing?(method)

    raise NoMethodError, method
  end

  def respond_to_missing?(method, _include_all = nil)
    all_keys.include?(method.to_s)
  end

  def [](key)
    method_missing(key) if respond_to_missing?(key)
  end

  private

  def all_keys
    keys + allowed_attributes
  end
end

class JSONBaseError < StandardError; end
