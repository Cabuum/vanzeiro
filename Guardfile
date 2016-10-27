guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) do |m|
    "/assets/#{m[3]}"
  end
end

guard 'migrate' do
  watch(%r{^db/migrate/(\d+).+\.rb})
  watch('db/seeds.rb')
end

guard 'zeus', cli: '> /dev/null' do
end

rspec_options = {
  results_file: './tmp/guard_rspec_results.txt',
  cmd: 'zeus rspec',
  all_after_pass: false,
  failed_mode: :focus
}

guard :rspec, rspec_options do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  rails = dsl.rails(view_extensions: %w(erb haml slim))
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  watch(rails.controllers) do |m|
    [
      rspec.spec.call("routing/#{m[1]}_routing"),
      rspec.spec.call("controllers/#{m[1]}_controller"),
      rspec.spec.call("acceptance/#{m[1]}")
    ]
  end

  watch(rails.spec_helper)     { rspec.spec_dir }
  watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
  end
end

guard :rubocop, all_on_start: false, cli: '-aD' do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end