require 'bowling'

RSpec.describe Bowling, "#score" do
  context "with no strikes or spares" do
    it "sums up the pin count for each roll" do
      bowling = Bowling.new
      20.times { bowling.hit(3) }
      expect(bowling.score).to eq 60
    end
  end

  context "with only one strike and no spare" do
    it "calculates the right score with the strike" do
      bowling = Bowling.new
      bowling.hit(10)
      19.times { bowling.hit(4) }
      expect(bowling.score).to eq 94
    end
  end

  context "with only one spare with no strike" do
    it "calculates the right score with the spare" do
      bowling = Bowling.new
      bowling.hit(5)
      bowling.hit(5)
      18.times { bowling.hit(4) }
      expect(bowling.score).to eq 86
    end
  end
end
