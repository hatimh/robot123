class Grenade < Weapon
  
  def initialize
    super("Grenade", 40, 15)
    @range += 1
  end  
end