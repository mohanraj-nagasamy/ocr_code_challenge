require 'spec_helper'
require 'ocr_code_challenge/ocr/digit_parser'
require 'ocr_code_challenge/ocr/file_parser'

describe OCR::FileParser do
  subject { described_class.new("spec/test_file.txt") }

  describe "#parsed" do
    it "should return 1..9" do
      subject.parsed.first.should eq (1..9).to_a
    end
    it "should return with invalid contents" do
      subject.parsed.last.should eq [1, 2, 3, 4, "?", 6, 7, 8, "?"]
    end
  end

  describe "#formated" do
    it "should return 1..9" do
      subject.formated.first.should eq (1..9).to_a.join("")
    end
    it "should return with invalid contents" do
      subject.formated.last.should eq '1234?678? ILL'
    end
  end

  describe "#write_to" do
    it "should return with invalid contents" do
      subject.stub(:output_contents).and_return :some_content
      File.should_receive(:write).with "spec/test_file.txt.out", :some_content
      subject.write_to
    end
  end
end
