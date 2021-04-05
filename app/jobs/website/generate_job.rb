class Website
  class GenerateJob < ApplicationJob
    queue_as :default

    def perform(website, hugo: Hugo.new, markdown_writer: MarkdownWriter.new)
      hugo.run!('/app/storage/build') do |folder|
        website.blog_posts.each do |post|
          markdown_writer.write(folder, post)
        end
      end
    end
  end
end
