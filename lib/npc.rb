class NPC
  attr_reader :name, :stats, :xp
  def initialize(name, stats = {}, xp = 100, item = nil)
    @name = name
    @stats = stats
    @xp = xp
    @current_hp = @stats[:hp]
    @item = item
  end

  def dead?
    @current_hp < 1
  end

  def loot
    {:xp => @xp, :item => @item}
  end

  def damage
    (@stats[:damage] + @xp * 0.1).round
  end

  def recieve_damage(player)
    damage_reduction = (1.00 - 100 / (100.00 + @stats[:armour])) * 100
    @current_hp = @current_hp - (player.damage * damage_reduction).round
  end

end