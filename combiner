#!/usr/bin/env ruby
#

require 'optparse'
require 'io/console'
require 'pry'

class WordlistParser
  Version = "1.0.0"

  OUTPUT = {stdout: true, file: false}

  class ScriptOptions

    attr_accessor :file1, :file2, :file3, :verbose,  :encoding
    def initialize
      self.verbose = true
      self.encoding = "utf8"
    end

    def define_options(parser)
      parser.banner = "Usage: examble.rb -l1 file1 -l2 file2"
      parser.separator ""

      file_opt1(parser)
      file_opt2(parser)

      parser.on_tail("--version", "Show version") do
          puts Version
          exit
      end
      self
    end

    def file_opt1(parser)
      parser.on("-l1", "--file1 FILE1") do |f1|
        self.file1 = f1
      end
    end

    def file_opt2(parser)
      parser.on("-l2", "--file2 FILE2") do |f2|
        self.file2 = f2
      end
    end
  end

  def parse(args)
    @options = ScriptOptions.new
    @args = OptionParser.new do |parser|
      @options.define_options(parser)
      parser.parse!(args)
    end
   @options 
  end

  attr_reader :parser, :options
end # Class WordlistParser

wordlist_parser = WordlistParser.new
options = wordlist_parser.parse(ARGV)
file = File.new( "output-wordlist.txt", "w")
file.chmod( 0755 )
IO.foreach(options.file1) do |l|
  IO.foreach(options.file2) do |w|
    file.write("#{l.strip}:#{w.strip}\n")
  end
end
file.close
