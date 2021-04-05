module ApplicationHelper
  def flashes
    return unless flash.any?

    tag.div(class: 'content') do
      flash.each do |type, msg|
        concat(tag.div(msg, class: "notification is-#{type}"))
      end
    end
  end
end
