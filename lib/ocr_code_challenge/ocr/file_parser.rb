require 'ocr_code_challenge/ocr/digit_parser'

module OCR
  class FileParser
    def initialize(input_filename)
      @input_filename = input_filename
    end

    def parse
      @parsed ||= parsed_digits.map(&:parse)
    end

    def format
      @formated ||= parsed_digits.map(&:format)
    end

    def write_to(output_filename=nil)
      output_filename ||= "#{@input_filename}.out"
      File.write(output_filename, output_contents)
    end

    private

    def contents
      @contents ||= File.read(@input_filename)
    end
    
    def lines
      @lines ||= contents.lines
    end

    def parsed_digits
      @parsed_digits ||= lines.each_slice(4).map { |input| DigitParser.new(input) }
    end

    def output_contents
      parsed_digits.map(&:format).join("\n") + "\n"
    end
  end
end
