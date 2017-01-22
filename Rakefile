if ENV['RAILS_ENV'] != 'production'
  require 'rubocop/rake_task'
  require 'scss_lint/rake_task'
  require 'haml_lint/rake_task'
  require 'yamllint/rake_task'
  require 'rake/testtask'

  task default: [:test, :rubocop, :scss_lint, :haml_lint]

  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'linters') if ENV['CIRCLECI']

  desc 'rubocop linter task'
  task :rubocop do
    outputpath = if ENV['CIRCLECI']
                   "#{dir}/rubocop-results.html"
                 else
                   'rubocop-results.html'
                 end
    RuboCop::RakeTask.new do |t|
      t.options = [
        '-c', '.rubocop.yml', '-o', outputpath
      ]
      t.fail_on_error = true
    end
  end

  desc 'haml linter task'
  task :haml_lint do
    HamlLint::RakeTask.new do |t|
      t.config = '.haml-lint.yml'
      t.files = ['app/views/']
      t.quiet = false
    end
  end

  desc 'scss linter task'
  task :scss_lint do
    outputpath = if ENV['CIRCLECI']
                   "#{dir}/scss-results.txt"
                 else
                   'scss-results.txt'
                 end
    SCSSLint::RakeTask.new do |t|
      t.config = '.scss-lint.yml'
      t.args = ['-f', 'JSON', '-o', outputpath]
      t.files = Dir.glob(['app/assets'])
    end
  end

  YamlLint::RakeTask.new do |t|
    t.paths = %w(
      config/**/*.yml .haml-lint.yml .rubocop.yml .rubocop.enabled.yml
      .rubocop.disabled.yml .scss-lint.yml circle.yml test/**/*.yml
    )
  end
end

require File.expand_path('../config/application', __FILE__)
Rails.application.load_tasks
