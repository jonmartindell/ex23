require "spec_helper"

describe Ask do
  it "can resolve" do
    expect(Ask.new("prompt text", {})).to respond_to(:resolve)
  end

  describe "initialize" do
    it "requires a prompt" do
      expect{Ask.new}.to raise_error ArgumentError
    end

    it "requires a map of answers to resolvable"
  end

  describe "resolve" do
    let(:answer_map) do
      { a: Tell.new("first letter"),
        b: Tell.new("second letter"),
        c: Tell.new("third letter") }
    end
    subject { Ask.new("enter letter A-C", answer_map) }
    it "prompts the user for an answer" do
      allow(STDIN).to receive(:gets).and_return("a")
      expect{subject.resolve}.to output(/enter letter A-C/).to_stdout
    end

    it "gives a list of valid options if they enter an invalid option" do
#      allow(STDIN).to receive(:gets).and_return("z").once
#      expect{subject.resolve}.to output(/Valid responses are: alkjds/).to_stdout
    end
    it "calls resolve on the appropriate option chosen"
  end
end
