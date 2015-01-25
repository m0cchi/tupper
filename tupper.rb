#!/usr/bin/env ruby
require 'optparse'

TUPPER_HOME =  `echo $([ -d "$TUPPER_HOME" ] && echo $TUPPER_HOME || echo $HOME/.tupper.d)`.chomp

def init
  scripts = []
  unless Dir.exist? TUPPER_HOME
    Dir.mkdir TUPPER_HOME
  end
  Dir.glob TUPPER_HOME + '/*' do |f|
    print "source #{f};" if File.basename(f).match /^(?!\.).+/
  end
end

OptionParser.new{ |opt|  
  opt.on 'init' do
    init
  end
}.parse!
