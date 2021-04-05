describe Website::MarkdownWriter do
  subject(:writer) { described_class.new(file: file, front_matter: front_matter) }

  let(:file) { instance_spy(File) }
  let(:front_matter) { class_spy(Website::FrontMatter, for: '---\ntitle: foo\n---\n\n') }
  let(:post) { build(:blog_post, title: 'foo', content: '## hallo welt') }

  describe '#write' do
    before do
      writer.write('/tmp', post)
    end

    it 'writes into the right file' do
      expect(file).to have_received(:write).with('/tmp/posts/foo.md', anything)
    end

    it 'writes markdown into the file' do
      expect(file).to have_received(:write).with(anything, /hallo welt/)
    end

    it 'writes the frontmatter' do
      expect(file).to have_received(:write).with(anything, /title: foo/)
    end
  end
end
