describe Website::FrontMatter do
  subject(:front_matter) { described_class.for(post) }

  let(:post) { build(:blog_post, :with_created_at) }
  let(:lines) { front_matter.split(/\n/) }

  describe 'basis structure' do
    it 'adds the leading dashes' do
      expect(lines.first).to eql('---')
    end

    it 'adds trailing dashes and newlines' do
      expect(front_matter[-5, 5]).to eql("---\n\n")
    end
  end

  describe 'simple fields' do
    it 'adds the title' do
      expect(lines).to include("title: #{post.title}")
    end

    it 'adds the url' do
      expect(lines).to include("url: \"#{post.path}\"")
    end

    it 'adds the date' do
      expect(lines).to include("date: #{post.created_at.to_date}")
    end
  end

  describe 'draft status' do
    context 'when post is draft' do
      let(:post) { build(:blog_post, :with_created_at, draft: true) }

      it 'includes draft field' do
        expect(lines).to include('draft: true')
      end
    end

    context 'when post is not published' do
      let(:post) { build(:blog_post, :with_created_at, draft: false) }

      it 'does not include draft field' do
        expect(front_matter).not_to match(/draft:/)
      end
    end
  end
end
