require 'spec_helper'
require 'ocr_code_challenge/ocr/digit_mapper'

describe OCR::DigitMapper do
  describe ".digit_map" do
    it "should return 0..9" do
      OCR::DigitMapper.digit_map.values.should eq (0..9).to_a
    end
  end
end
