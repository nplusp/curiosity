require 'spec_helper'

describe Curiosity do
  describe "when adding rover" do
    context "he does" do
      it "creates with default position and facing" do
        curiosity = Curiosity.new
        expect(curiosity.x).to eql 1
        expect(curiosity.y).to eql 1
        expect(curiosity.facing).to eql 'N'
      end

      it "creates with custom position and facing" do
        curiosity = Curiosity.new(x: 2, y: 3, facing: 'W')
        expect(curiosity.x).to eql 2
        expect(curiosity.y).to eql 3
        expect(curiosity.facing).to eql 'W'
      end
    end

    context "he doesn't" do
      it "creates with invalid position" do
        expect { Curiosity.new(x: "Invalid", y: "Input") }.to raise_error(ArgumentError)
      end

      it "creates with negative position" do
        expect { Curiosity.new(x: -2, y: 0) }.to raise_error(ArgumentError, "Invalid rover position")
      end

      it "creates with invalid facing" do
        expect { Curiosity.new(facing: "invalid") }.to raise_error(ArgumentError, "Invalid facing")
      end
    end
  end

  describe "when rover is moving" do
    let(:curiosity) { Curiosity.new }

    context "he does" do
      it "turns left" do
        curiosity.execute_command("L")
        expect(curiosity.x).to eql 1
        expect(curiosity.y).to eql 1
        expect(curiosity.facing).to eql "W"
      end

      it "turns right" do
        curiosity.execute_command("R")
        expect(curiosity.x).to eql 1
        expect(curiosity.y).to eql 1
        expect(curiosity.facing).to eql "E"
      end

      it "moves forward" do
        curiosity.execute_command("M")
        expect(curiosity.x).to eql 1
        expect(curiosity.y).to eql 2
        expect(curiosity.facing).to eql "N"
      end

      it "moves with multiple commands" do
        curiosity.execute_command("RMMMMLMMMMRR")
        expect(curiosity.x).to eql 5
        expect(curiosity.y).to eql 5
        expect(curiosity.facing).to eql "S"
      end
    end

    context "he doesn't" do
      it "turns and moves with invalid commands" do
        expect { curiosity.execute_command("A") }.to raise_error(ArgumentError, "Invalid movement command")
        expect { curiosity.execute_command(123) }.to raise_error(ArgumentError, "Invalid movement command")
        expect { curiosity.execute_command("ABAHKDHJASD") }.to raise_error(ArgumentError, "Invalid movement command")
      end
    end
  end
end
