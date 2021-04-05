describe Website::Command do
  let(:command) { described_class }
  let(:open3) { class_spy(Open3, capture3: ['out', 'error', status]) }
  let(:status) { instance_double(Process::Status, success?: true) }

  describe '#run' do
    it 'executes the command' do
      command.run("echo 'foobar'", open3: open3)

      expect(open3).to have_received(:capture3).with("echo 'foobar'")
    end

    context 'when the status is not a success' do
      let(:status) { instance_double(Process::Status, success?: false) }

      it 'raises an error' do
        expect do
          command.run('foo', open3: open3)
        end.to raise_error(command::FailedError).with_message('foo: error')
      end
    end

    context 'when the command was not found' do
      it 'raises an error' do
        allow(open3).to receive(:capture3).and_raise(Errno::ENOENT.new('foo'))

        expect do
          command.run('foo', open3: open3)
        end.to raise_error(command::FailedError).with_message('foo: No such file or directory - foo')
      end
    end
  end
end
