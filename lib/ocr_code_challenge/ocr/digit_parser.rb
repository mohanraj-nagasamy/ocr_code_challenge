module OCR
  class DigitParser

    def initialize(input)
      @input = input
    end
    
    def parse
      line1, line2, line3, line4 = @input.split("\n")

      line1_by_3 = line1.scan /.../
      line2_by_3 = line2.scan /.../
      line3_by_3 = line3.scan /.../
      line4_by_3 = line4.scan /.../

      digits = []

      line1_by_3.each_with_index do |ch, index| 
        ch += "\n" + line2_by_3[index] + "\n" + line3_by_3[index]+ "\n" + line4_by_3[index] + "\n";
        digits << (DigitMapper.digit_map[ch] || '?')
      end
      digits
    end
    def format
      formated_s = parse.join("")
      if formated_s.include? "?"
        return "#{formated_s} ILL" 
      end
      formated_s
    end
  end
end
