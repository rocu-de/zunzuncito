require 'rails_helper'

describe 'Blogpost management', type: :request do
  let(:website) { create(:website) }
  let(:blog_post) { create(:blog_post, website: website) }

  describe 'creating and showing a blogpost' do
    context 'with valid params' do
      let(:params) { attributes_for(:blog_post) }

      it 'creates a website and redirects to index page' do
        get "/websites/#{website.id}/blog_posts/new"
        expect(response.body).to include('Neuen Blogartikel anlegen')

        post "/websites/#{website.id}/blog_posts", params: params
        follow_redirect!

        expect(request.path).to match %r{/websites/[0-9]+/blog_posts}
        expect(response.body).to include('Blogpost was successfully created.')
      end
    end

    context 'with invalid params' do
      let(:params) { { title: '' } }

      it 'rerenders the form' do
        post "/websites/#{website.id}/blog_posts", params: params

        expect(response.body).to include('Neuen Blogartikel anlegen')
      end
    end
  end

  describe 'updating a blogpost' do
    context 'with valid params' do
      let(:params) { attributes_for(:blog_post) }

      it 'updates the blogpost' do
        get "/blog_posts/#{blog_post.id}/edit"

        expect(response.body).to include('Blogartikel bearbeiten')

        patch "/blog_posts/#{blog_post.id}", params: params
        follow_redirect!

        expect(request.path).to match %r{/websites/[0-9]+/blog_posts}
        expect(response.body).to include('Blogpost was successfully updated.')
        expect(response.body).to include(params[:title])
      end
    end

    context 'with invalid params' do
      let(:params) { { title: '' } }

      it 'rerenders the form' do
        patch "/blog_posts/#{blog_post.id}", params: params
        expect(response.body).to include('Blogartikel bearbeiten')
      end
    end
  end

  describe 'deleting a website' do
    it 'works' do
      delete "/blog_posts/#{blog_post.id}"
      follow_redirect!

      expect(request.path).to match %r{/websites/[0-9]+/blog_posts}
    end
  end
end
