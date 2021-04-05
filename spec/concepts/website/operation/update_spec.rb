require 'rails_helper'

describe Website::Operation::Update do
  let(:website) { create(:website) }

  context 'with invalid params' do
    let(:params) { { id: website.id, title: '', theme: '' } }

    it 'does not update the website' do
      result = described_class.call(params: params)

      expect(result).not_to be_success
      expect(result[:model].title).not_to eql(params[:title])
    end
  end

  context 'with valid params' do
    let(:params) { { id: website.id }.merge(attributes_for(:website)) }

    it 'updates the website' do
      result = described_class.call(params: params)

      expect(result).to be_success
      expect(result[:model].title).to eql(params[:title])
    end
  end
end
