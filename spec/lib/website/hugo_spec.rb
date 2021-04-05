describe Website::Hugo do
  subject(:hugo) { described_class.new(dir: dir, file: file, runner: runner) }

  let(:dir) do
    dir = class_spy(Dir)
    allow(dir).to receive(:mktmpdir).and_yield('/tempdir')
    dir
  end
  let(:file) { class_spy(File) }
  let(:runner) { instance_spy(Website::Command) }

  describe '#run!' do
    it 'creates a tmpdir' do
      expect { |b| hugo.run!('/output/dir', &b) }.to yield_with_args('/tempdir/content')
    end

    it 'creates hugo site' do
      hugo.run!('/output/dir')
      expect(runner).to have_received(:run).with('hugo new site /tempdir --force')
      expect(runner).to have_received(:run).with('mkdir -p /tempdir/content/posts')
    end

    it 'cleans up hugo site' do
      hugo.run!('/output/dir')
      expect(runner).to have_received(:run).with('rm /tempdir/config.toml')
    end

    it 'writes hugo config' do
      hugo.run!('/output/dir')
      expect(file).to have_received(:write).with('/tempdir/config.yml', %r{publishDir: "/output/dir"})
    end

    it 'generates the site' do
      hugo.run!('/output/dir')
      expect(runner).to have_received(:run).with('hugo -s /tempdir')
    end
  end
end
