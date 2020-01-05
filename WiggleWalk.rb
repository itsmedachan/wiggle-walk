class WiggleWalk
  def initialize(r, c, sr, sc)
    @r = r
    @c = c
    @sr = sr
    @sc = sc
    @footprints = []
  end

  def sr
    @sr
  end

  def sc
    @sc
  end

  def give_instruction
    case [@sr, @sc]
    when [1, 1]
      return ["S", "E"].sample
    when [1, @c]
      return ["S", "W"].sample
    when [@r, 1]
      return ["N", "E"].sample
    when [@r, @c]
      return ["N", "W"].sample
    end

    case @sr
    when 1
      return ["S", "E", "W"].sample
    when @r
      return ["N", "E", "W"].sample
    end

    case @sc
    when 1
      return ["N", "S", "E"].sample
    when @c
      return ["N", "S", "W"].sample
    end

    return ["N", "S", "E", "W"].sample
  end

  def right_direction?(direction)
    if @sr == 1 && direction == "N"
      return false
    elsif @sr == @r && direction == "S"
      return false
    elsif @sc == @c && direction == "E"
      return false
    elsif @sc == 1 && direction == "W"
      return false
    end
    true
  end

  def step_to(direction)
    @footprints << [@sr, @sc]
    case direction
    when "N"
      @sr = @sr - 1
    when "S"
      @sr = @sr + 1
    when "E"
      @sc = @sc + 1
    when "W"
      @sc = @sc - 1
    end
  end

  def have_you_been_here?
    @footprints.include?([@sr, @sc])
  end
end