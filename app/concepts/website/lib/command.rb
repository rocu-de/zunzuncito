class Website
  class Command
    class FailedError < StandardError; end

    def self.run(cmd, open3: Open3)
      new(open3: open3).run(cmd)
    end

    def initialize(open3:)
      @open3 = open3
    end

    def run(cmd)
      _out, err, status = @open3.capture3(cmd)

      raise FailedError, "#{cmd}: #{err}" unless status.success?
    rescue Errno::ENOENT => e
      raise FailedError, "#{cmd}: #{e.message}"
    end
  end
end
