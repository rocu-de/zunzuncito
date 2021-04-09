require 'simplecov'
require 'simplecov_json_formatter'

SimpleCov.configure do
  enable_coverage :branch
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::JSONFormatter
    ]
  )
end

SimpleCov.start('rails')

SimpleCov.at_exit do
  SimpleCov.result.format!
end

SimpleCov.minimum_coverage line: 100, branch: 100
