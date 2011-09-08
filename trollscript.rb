class TrollScript
  def initialize
    @ops = create_ops
    @tape = Array.new(1024,0)
    @tp = 0
    @code = []
    @cp = 0
  end

  def compile c
    c = c.gsub(/\s/, "")
    c.split("").each_slice(3) do |o|
      o = o.join.downcase
      if @ops.has_key? o
        @code << o
      end
    end
    self
  end

  def run
    while @cp < @code.size
      run_op @code[@cp]
    end
    @cp = 0
  end

  private

  def run_op op
    @ops[op].call
    @cp += 1
  end

  def get_input
    @tape[@tp] = STDIN.getc
    @tape[@tp] = 0 unless @tape[@tp]
  end

  def create_ops
    {
      "tro" => Proc.new {},
      "ooo" => Proc.new { @tp = (@tp == @tape.size - 1 ? 0 : @tp + 1) },
      "ool" => Proc.new { @tp = (@tp == 0 ? @tape.size - 1 : @tp - 1) },
      "olo" => Proc.new { @tape[@tp] += 1 },
      "oll" => Proc.new { @tape[@tp] -= 1 },
      "loo" => Proc.new { print @tape[@tp].chr if @tape[@tp] },
      "lol" => Proc.new { get_input },
      "llo" => Proc.new { jump_to_close if @tape[@tp] == 0 },
      "lll" => Proc.new { jump_to_open unless @tape[@tp] == 0 },
      "ll." => Proc.new {}
    }
  end

  def jump_to_close
    level = 1
    while @cp < @code.size
      @cp += 1
      if @code[@cp] == 'llo'
        level += 1
      elsif @code[@cp] == 'lll'
        level -= 1
      end
      break if level == 0
    end
  end

  def jump_to_open
    level = 1
    while @cp >= 0
      @cp -= 1
      if @code[@cp] == 'lll'
        level += 1
      elsif @code[@cp] == 'llo'
        level -= 1
      end
      break if level == 0
    end
  end
end

app = TrollScript.new
app.compile(ARGF.read)
app.run
