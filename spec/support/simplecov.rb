require 'simplecov'

SimpleCov.configure do
  enable_coverage :branch
end

SimpleCov.start('rails')

SimpleCov.at_exit do
  SimpleCov.result.format!
end

SimpleCov.minimum_coverage line: 100, branch: 100
