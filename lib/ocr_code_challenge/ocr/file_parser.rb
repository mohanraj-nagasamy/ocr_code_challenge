require 'ocr_code_challenge/ocr/digit_parser'
require 'ocr_code_challenge/check_sum_calculator'

module OCR
  class FileParser
    def initialize(input_filename)
      @input_filename = input_filename
    end

    def parsed
      @parsed ||= parsed_digits.map(&:parse)
    end

    def formated
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

    def valid_and_invalid_numerics
      @valid_and_invalid_numerics ||= formated.group_by { |input| CheckSumCalculator.numeric?(input) }
    end

    def valid_numerics
      @valid_numerics ||= valid_and_invalid_numerics[true] || []
    end

    def invalid_numerics
      @invalid_numerics ||= valid_and_invalid_numerics[false] || []
    end

    def valid_and_invalid_check_sums
      @valid_and_invalid_check_sums ||= valid_numerics.group_by { |input| CheckSumCalculator.new(input).valid? }
    end

    def valid_check_sums
      @valid_check_sums ||= valid_and_invalid_check_sums[true] || []
    end

    def valid_check_sum_contents
      contents = "Valid: \n"
      contents << valid_check_sums.join("\n") + "\n\n"
    end

    def invalid_check_sum_contents
      contents = "Invalid: \n"
      contents << invalid_check_sums.join("\n") + "\n"
    end

    def invalid_check_sums
      @invalid_check_sums ||= valid_and_invalid_check_sums[false] || []
    end

    def parsed_digits
      @parsed_digits ||= lines.each_slice(4).map { |input| DigitParser.new(input) }
    end

    def output_contents
      contents = formated.join("\n") + "\n\n"
      contents << valid_check_sum_contents
      contents << invalid_check_sum_contents
      contents << invalid_numerics.join("\n") + "\n"
      contents
    end
  end
end
