class Website
  class Hugo
    def initialize(dir: Dir, file: File, runner: Command)
      @dir = dir
      @file = file
      @runner = runner
    end

    def run!(output_dir)
      @dir.mktmpdir do |temp_dir|
        create_site!(temp_dir)
        cleanup!(temp_dir)
        write_config!(temp_dir, output_dir)

        yield("#{temp_dir}/content") if block_given?

        generate!(temp_dir)
      end
    end

    private

    def create_site!(dir)
      @runner.run("hugo new site #{dir} --force")
      @runner.run("mkdir -p #{dir}/content/posts")
    end

    def cleanup!(dir)
      @runner.run("rm #{dir}/config.toml")
    end

    def write_config!(dir, output_dir)
      @file.write("#{dir}/config.yml", config_yaml(output_dir))
    end

    def generate!(dir)
      @runner.run("hugo -s #{dir}")
    end

    def config_yaml(output_dir)
      YAML.dump(
        {
          'baseURL' => 'http://localhost:2301/',
          'languageCode' => 'de-de',
          'title' => 'Rocu.de',
          'theme' => 'archie',
          'themesDir' => '/hugo/themes',
          'publishDir' => output_dir
        }
      )
    end
  end
end
