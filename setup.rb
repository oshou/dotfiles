#!/usr/bin/env ruby

CURRENT_DIRECTORY = File.expand_path(File.dirname(__FILE__))
HOME = File.expand_path('~')

def setup
    files = [
        '.bash_logout',
        '.bash_profile',
        '.bashrc',
        '.cshrc',
        '.gitconfig',
        '.gitignore',
        '.tcshrc',
        '.tmux.conf',
        '.vimrc'
    ]
    files.each do |f|
        source = File.join(CURRENT_DIRECTORY,f)
        destination = File.join(HOME, ".#{f}")
        `ln -sf "#{source}" "#{destination}"`
        puts "make link #{source} to #{destination}"
    end
end

setup()
