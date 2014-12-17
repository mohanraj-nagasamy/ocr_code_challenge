require 'spec_helper'
require 'ocr_code_challenge/ocr/digit_mapper'
require 'ocr_code_challenge/ocr/digit_parser'

describe OCR::DigitParser do

  describe "parse and format zeros" do
    let(:zeros) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|
                           
STR
    end

    describe "#parse" do
      it "should parse zeros" do
        described_class.new(zeros).parse.should eq ([0] * 9)
      end
    end

    describe "#format" do
      it "should format zeros" do
        described_class.new(zeros).format.should eq ('0' * 9)
      end
    end
  end

  describe "parse and format ones" do
    let(:ones) do
<<-STR
                           
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |
                           
STR
    end

    describe "#parse" do
      it "should parse ones" do
        described_class.new(ones).parse.should eq ([1] * 9)
      end
    end

    describe "#format" do
      it "should format ones" do
        described_class.new(ones).format.should eq ('1' * 9)
      end
    end
  end

  describe "parse and format twos" do
    let(:twos) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
 _| _| _| _| _| _| _| _| _|
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
                           
STR
    end

    describe "#parse" do
      it "should parse twos" do
        described_class.new(twos).parse.should eq ([2] * 9)
      end
    end

    describe "#format" do
      it "should format twos" do
        described_class.new(twos).format.should eq ('2' * 9)
      end
    end
  end

  describe "parse and format threes" do
    let(:threes) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
 _| _| _| _| _| _| _| _| _|
 _| _| _| _| _| _| _| _| _|
                           
STR
    end

    describe "#parse" do
      it "should parse threes" do
        described_class.new(threes).parse.should eq ([3] * 9)
      end
    end

    describe "#format" do
      it "should format threes" do
        described_class.new(threes).format.should eq ('3' * 9)
      end
    end
  end

  describe "parse and format fours" do
    let(:fours) do
<<-STR
                           
|_||_||_||_||_||_||_||_||_|
  |  |  |  |  |  |  |  |  |
                           
STR
    end

    describe "#parse" do
      it "should parse fours" do
        described_class.new(fours).parse.should eq ([4] * 9)
      end
    end

    describe "#format" do
      it "should format fours" do
        described_class.new(fours).format.should eq ('4' * 9)
      end
    end
  end

  describe "parse and format fives" do
    let(:fives) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
 _| _| _| _| _| _| _| _| _|
                           
STR
    end

    describe "#parse" do
      it "should parse fives" do
        described_class.new(fives).parse.should eq ([5] * 9)
      end
    end

    describe "#format" do
      it "should format fives" do
        described_class.new(fives).format.should eq ('5' * 9)
      end
    end
  end

  describe "parse and format sixes" do
    let(:sixes) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
|_ |_ |_ |_ |_ |_ |_ |_ |_ 
|_||_||_||_||_||_||_||_||_|
                           
STR
    end

    describe "#parse" do
      it "should parse sixes" do
        described_class.new(sixes).parse.should eq ([6] * 9)
      end
    end

    describe "#format" do
      it "should format sixes" do
        described_class.new(sixes).format.should eq ('6' * 9)
      end
    end
  end

  describe "parse and format sevens" do
    let(:sevens) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |
                           
STR
    end

    describe "#parse" do
      it "should parse sevens" do
        described_class.new(sevens).parse.should eq ([7] * 9)
      end
    end

    describe "#format" do
      it "should format sevens" do
        described_class.new(sevens).format.should eq ('7' * 9)
      end
    end
  end

  describe "parse and format eights" do
    let(:eights) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|
                           
STR
    end

    describe "#parse" do
      it "should parse eights" do
        described_class.new(eights).parse.should eq ([8] * 9)
      end
    end

    describe "#format" do
      it "should format eights" do
        described_class.new(eights).format.should eq ('8' * 9)
      end
    end
  end

  describe "parse and format nines" do
    let(:nines) do
<<-STR
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
 _| _| _| _| _| _| _| _| _|
                           
STR
    end

    describe "#parse" do
      it "should parse nines" do
        described_class.new(nines).parse.should eq ([9] * 9)
      end
    end

    describe "#format" do
      it "should format nines" do
        described_class.new(nines).format.should eq ('9' * 9)
      end
    end
  end

  describe "parse and format 1..9" do
    let(:one_to_nine) do
<<-STR
    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _| 
                           
STR
    end

    describe "#parse" do
      it "should parse one_to_nine" do
        described_class.new(one_to_nine).parse.should eq (1..9).to_a
      end
    end

    describe "#format" do
      it "should format one_to_nine" do
        described_class.new(one_to_nine).format.should eq ('123456789')
      end
    end
  end

  describe "error scenarios" do

  end

end
