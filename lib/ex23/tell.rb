class Tell
  def initialize(answer_text)
    raise ArgumentError "Answer length must be > 0" unless answer_text.length > 0
    @answer_text = answer_text
  end

  def resolve
    puts answer_text
  end

  private
  attr_reader :answer_text
end
