require 'rake'
require 'fileutils'
require 'rubygems'

desc "Make complete setup of configuration files. Can be run multiple times."
task :setup do
  Dir['*'].each do |file|
    next if %w[README Rakefile Gemfile Gemfile.lock].include?(file)
    source_file = File.join(Dir.pwd, file)
    config_file = File.join(ENV['HOME'], ".#{file}")
    File.symlink(source_file, config_file) unless File.exist?(config_file) || File.symlink?(config_file)
  end
  system("source #{ENV['HOME']}/.shell_aliases.d/compile_shell_aliases.sh && compile_shell_aliases")
end
