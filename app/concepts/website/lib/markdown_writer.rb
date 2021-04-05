class Website
  class MarkdownWriter
    def initialize(file: File, front_matter: FrontMatter)
      @file = file
      @front_matter = front_matter
    end

    def write(folder, post)
      @file.write(path(folder, post), file_content(post))
    end

    private

    def path(folder, post)
      "#{folder}/posts/#{post.title}.md"
    end

    def file_content(post)
      "#{@front_matter.for(post)}#{post.content}"
    end
  end
end
