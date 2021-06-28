#!/usr/bin/env ruby
#

require 'optparse'
require 'io/console'
require 'pry'

class WordlistParser
  Version = "1.0.0"

  OUTPUT = {stdout: true, file: false}

  class ScriptOptions

    attr_accessor :file1, :file2, :file3, :verbose, :encoding
    def initialize
      self.verbose = true
      self.encoding = "utf8"
    end

    def define_options(parser)
      parser.banner = "Usage: examble.rb -l1 file1 -l2 file2"
      parser.seperator=""

      file1(parser)
      file2(parser)
      binding.pry

      parser.on_tail("--version", "Show version") do
          puts Version
          exit
      end
      self
    end

    def file1(parser)
      parser.on("-l1", "--file1 FILE1") do |file1|
        self.file1 = file1
      end
    end

    def file2(parser)
      parser.on("-l2", "--file2 FILE2") do |file2|
        self.file2 = file2
      end
    end
  end

  def parse(*args)
    options = OptionParser.new do |parser|
      parser.define_options(options)
    end
   options 
  end

end # Class WordlistParser

wordlist = WordlistParser.new
options = wordlist.parse(ARGV)
# file = File.new( "output-wordlist.txt", "w")
# file.chmod( 0755 )
# IO.foreach(options.file1) do |l|
 #  IO.foreach(options.file2) do |w|
      # file.write(l + ':' + w + '\n')
  # end
#jend
#file.close


