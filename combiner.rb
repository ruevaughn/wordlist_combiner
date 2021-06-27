#!/usr/bin/env ruby
#

require 'optparse'

class WordlistParser
  Version = "1.0.0"

  OUTPUT = {stdout: true, file: false}


  class ScriptOptions
    attr_accessor :file1, :file2, :combined_file,

    def initialize
      self.verbose = true
      self.encoding = "utf8"
    end

    def define_options(parser)
      parser.banner = "Usage: examble.rb -l1 file1 -l2 file2"
      parser.seperator=""

      file1(parser)
      file2(parser)

       parser.on_tail("--version", "Show version") do
          puts Version
          exit
      end
    end

    def file1(parser)
      parser.on("-l1", "--file1 FILE1") do file1
        self.file1 = file1 if File.exist?(file1)
      end
    end

    def file2(parser)
      parser.on("-l2", "--file2 FILE2") do file2
        self.file2 = file2 if File.exist?(file2)
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
end # Class WordlistParser

wordlist = WordlistParser.new
options = wordlist.parse(ARGV)
print options
print ARGV
