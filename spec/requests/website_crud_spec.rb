require 'rails_helper'

describe 'Website management', type: :request do
  let(:website) { create(:website) }

  describe 'creating  a website' do
    context 'with valid params' do
      let(:params) { attributes_for(:website) }

      it 'creates a website and redirects to detail page' do
        get '/websites/new'
        expect(response.body).to include('Neue Webseite anlegen')

        post '/websites', params: params
        follow_redirect!

        expect(request.path).to match %r{/websites/[0-9]+}
        expect(response.body).to include('Website was successfully created.')
      end
    end

    context 'with invalid params' do
      let(:params) { { title: '' } }

      it 'rerenders the form' do
        post '/websites', params: params

        expect(response.body).to include('Neue Webseite anlegen')
      end
    end
  end

  describe 'updating a website' do
    let(:params) { attributes_for(:website) }

    context 'with valid params' do
      it 'updates the website' do
        get "/websites/#{website.id}/edit"
        expect(response.body).to include('Webseite bearbeiten')

        patch "/websites/#{website.id}", params: params
        follow_redirect!

        expect(request.path).to match %r{/websites/[0-9]+}
        expect(response.body).to include('Website was successfully updated.')
        expect(response.body).to include(params[:title])
      end
    end

    context 'with invalid params' do
      let(:params) { { title: '' } }

      it 'does not update the website' do
        patch "/websites/#{website.id}", params: params
        expect(response.body).to include('Webseite bearbeiten')
      end
    end
  end

  describe 'deleting a website' do
    it 'works' do
      delete "/websites/#{website.id}"
      follow_redirect!

      expect(request.path).to eql('/websites')
    end
  end
end
