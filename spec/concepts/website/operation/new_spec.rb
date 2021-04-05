require 'rails_helper'

describe Website::Operation::New do
  it 'initializes a new website and form' do
    result = described_class.call

    expect(result).to be_success
    expect(result[:model]).not_to be_persisted
    expect(result['contract.default']).to be_present
  end
end
