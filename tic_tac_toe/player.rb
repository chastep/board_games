class Player
  VALID_SYMBOLS = %w(X O).freeze

  attr_reader :name, :symbol

  def initialize(player_attrs)
    @name = player_attrs.fetch(:name)
    @symbol = player_attrs.fetch(:symbol)
  end

  def self.intake_and_create(p1 = nil)
    info_hash = {
      name: '',
      symbol: ''
    }

    name_prompt(info_hash)
    symbol_prompt(p1, info_hash)
    Player.new(info_hash)
  end

  def self.name_prompt(info_hash)
    prompt = 'Please provide player name:'
    puts prompt
    while name = gets.chomp
      case name
      when ""
        puts 'Error: name cannot be blank.'
        puts prompt
      else
        info_hash[:name] = name.capitalize
        puts 'Name successfully saved!'
        break
      end
    end
  end

  def self.symbol_prompt(p1 = nil, info_hash)
    if p1
      info_hash[:symbol] = VALID_SYMBOLS.select { |n| n != p1.symbol }.first
    else
      symbol_prompt = 'Please select your symbol: "X" or "O"'
      puts symbol_prompt
      while symbol = gets.chomp.upcase
        if VALID_SYMBOLS.include?(symbol)
          info_hash[:symbol] = symbol
          puts 'Symbol successfully saved!'
          break
        else
          puts 'Invalid symbol selection, try again.'
          puts symbol_prompt
        end
      end
    end
  end
end
