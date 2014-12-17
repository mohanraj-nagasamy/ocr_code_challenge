require 'spec_helper'
require 'ocr_code_challenge/check_sum_calculator'

describe CheckSumCalculator do
  
  describe "Valid" do
    let(:subject_1) { CheckSumCalculator.new('711111111') }
    let(:subject_2) { CheckSumCalculator.new('123456789') }
    let(:subject_3) { CheckSumCalculator.new('490867715') }
    let(:subject) { [subject_1, subject_2, subject_3] }

    describe "#checksum" do
      it "should return zero checksum" do
        subject.each { |e| e.checksum.should eq 0 }
      end
    end
    describe "#valid?" do
      it "should return true" do
        subject.each { |e| e.valid?.should eq true }
      end
    end
  end
  
  describe "Invalid" do
    let(:subject_1) { CheckSumCalculator.new('888888888') }
    let(:subject_2) { CheckSumCalculator.new('490067715') }
    let(:subject_3) { CheckSumCalculator.new('012345678') }
    let(:subject) { [subject_1, subject_2, subject_3] }

    describe "#checksum" do
      it "should return non-zero checksum" do
        subject.each { |e| e.checksum.should_not eq 0 }
      end
    end
    describe "#valid?" do
      it "should return false" do
        subject.each { |e| e.valid?.should eq false }
      end
    end
  end
end
