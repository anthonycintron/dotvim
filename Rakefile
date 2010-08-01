require 'fileutils'

namespace :vim do
  desc 'Install vim configuration'
  task :install do
    home_dir    = File.expand_path('~/')
    current_dir = File.expand_path(File.dirname(__FILE__))

    # get the submoduled plugins
    puts 'retrieving vim plugins'
    `git submodule init && git submodule update`

    # link rc files
    puts 'linking to files'
    %w(vimrc gvimrc).each do |file|
      FileUtils.ln_sf File.join(current_dir, file), File.join(home_dir, ".#{file}")
    end

    puts 'all done'
  end
end

task :default => 'vim:install'

