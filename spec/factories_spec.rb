# frozen_string_literal: true

require 'rails_helper'

describe FactoryBot do
  it 'all factories are valid' do
    factories_to_lint = FactoryBot.factories.reject do |factory|
      factory.name == :json_base
    end

    FactoryBot.lint factories_to_lint
  end
end
