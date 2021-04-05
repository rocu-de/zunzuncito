require 'rails_helper'

describe Website::Operation::Show do
  let(:website) { create(:website) }

  it 'finds the model' do
    result = described_class.call(params: { id: website.id })

    expect(result[:model]).to eql(website)
  end
end
