module OCR
  class DigitMapper
    def self.zero
<<-STR
 _ 
| |
|_|
   
STR
    end

    def self.one
<<-STR
   
  |
  |
   
STR
    end

    def self.two 
<<-STR
 _ 
 _|
|_ 
   
STR
    end
  
    def self.three
<<-STR
 _ 
 _|
 _|
   
STR
    end

    def self.four 
<<-STR
   
|_|
  |
   
STR
    end

    def self.five
<<-STR
 _ 
|_ 
 _|
   
STR
    end

    def self.six
<<-STR
 _ 
|_ 
|_|
   
STR
    end
  
    def self.seven
<<-STR
 _ 
  |
  |
   
STR
    end

    def self.eight
<<-STR
 _ 
|_|
|_|
   
STR
    end

    def self.nine
<<-STR
 _ 
|_|
 _|
   
STR
    end

    def self.digit_map
      {zero => 0, one => 1, two => 2, three => 3, four => 4, five => 5, six => 6, seven => 7, eight => 8, nine => 9}
    end
  end
end
