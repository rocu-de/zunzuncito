class Website
  class FrontMatter
    def self.for(post)
      new(post).generate
    end

    def initialize(post)
      @post = post
    end

    def generate
      "#{YAML.dump(attributes)}---\n\n"
    end

    def attributes
      attrs = {
        'title' => @post.title,
        'url' => @post.path,
        'date' => @post.created_at.to_date
      }

      attrs['draft'] = true if @post.draft?

      attrs
    end
  end
end
