require 'rails_helper'

describe Website::GenerateJob, type: :job do
  subject(:job) do
    described_class
  end

  let(:website) { build(:website, blog_posts: [post]) }
  let(:post) { build(:blog_post) }

  let(:markdown_writer) { instance_spy(Website::MarkdownWriter) }
  let(:hugo) do
    hugo = instance_spy(Website::Hugo)
    allow(hugo).to receive(:run!).and_yield('/tmp/dir')
    hugo
  end

  it 'writes blog post to files' do
    perform_now!

    expect(markdown_writer).to have_received(:write).with('/tmp/dir', post)
  end

  it 'runs hugo build process' do
    perform_now!

    expect(hugo).to have_received(:run!).with('/app/storage/build')
  end

  def perform_now!
    job.perform_now(website, markdown_writer: markdown_writer, hugo: hugo)
  end
end
