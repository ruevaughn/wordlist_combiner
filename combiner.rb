#!/usr/bin/env ruby
#

require 'optparse'
require 'io/console'
require 'pry'

class WordlistParser
  Version = "1.0.0"

  OUTPUT = {stdout: true, file: false}
  attr_accessor :file1, :file2, :combined_file

  class ScriptOptions

    attr_accessor :verbose, :encoding
    def initialize(parser)
      self.verbose = true
      self.encoding = "utf8"
      binding.pry
    end

    def define_options(parser)
      parser.banner = "Usage: examble.rb -l1 file1 -l2 file2"
      parser.seperator=""

      self.file1 = file1(parser)
      self.file2 = file2(parser)

       parser.on_tail("--version", "Show version") do
          puts Version
          exit
      end
    end

    def file1(parser)
      parser.on("-l1", "--file1 FILE1") do file1
        return file1
      end
    end

    def file2(parser)
      parser.on("-l2", "--file2 FILE2") do file2
        return file2
      end
    end
  end

  def parse(args)
    @options = ScriptOptions.new
    @args = WordlistParser.new do |parser|
      @options.define_options(parser)
      parser.parse!(args)
    end
    @options
  end

  def generate_new
    file = File.new( "output-wordlist.txt", "w")
    file.chmod( 0755 )
    IO.foreach(self.file1) do |l|
      IO.foreach(self.file2) do |w|
        file.write(l + ':' + w + '\n')
      end
    end
  file.close
  end

end # Class WordlistParser

wordlist = WordlistParser.new(
options = wordlist.parse(ARGV)
puts wordlist.file1
puts wordlist.file2

wordlist.generate_new

