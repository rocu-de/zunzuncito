require 'rails_helper'

describe Website::Operation::Create do
  context 'with invalid params' do
    it 'does not create a website' do
      result = described_class.call(params: { title: '', theme: '' })

      expect(result).not_to be_success
      expect(result[:model]).not_to be_persisted
    end
  end

  context 'with valid params' do
    it 'creates a website' do
      result = described_class.call(params: attributes_for(:website))

      expect(result).to be_success
      expect(result[:model]).to be_persisted
    end
  end
end
