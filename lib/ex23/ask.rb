class Ask

  def initialize(prompt_text, answer_map)
    raise ArgumentError "Prompt length must be > 0" unless prompt_text.length > 0
    raise ArgumentError "Answer map must be symbol -> resolvable" unless valid_answer_map?(answer_map)
    @prompt_text = prompt_text
    @answer_map = answer_map
  end

  def resolve
    answer = prompt()
    answer_map[answer].resolve()
  end

  private
  attr_reader :answer_map, :prompt_text

  def valid_answer_map?(answer_map)
    #TODO
    true
  end

  def prompt
    print prompt_text
    answer = STDIN.gets.strip
    answer = reprompt() unless valid_answers.include?(answer.downcase.to_sym)
    answer.downcase.to_sym
  end

  def reprompt
    puts "Valid responses are: #{valid_answers}"
    prompt
  end

  def valid_answers
    answer_map.keys
  end

end
