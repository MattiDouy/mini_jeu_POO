
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name 
    @life_points = 10
  end 

  def show_state
    puts "#{@name} à #{@life_points} points de vie"
  end

  def gets_damage(value)
    @life_points -= value
    puts "Il lui inflige #{value} points de dommages"
    if @life_points <= 0       
      puts "Le joueur #{@name} a été tué"
    end 
  end 

  def attacks(target)
    puts "Le joueur #{@name} attaque le joueur #{target.name}"
    damage = compute_damage
    target.gets_damage(damage)    
  end 
  def compute_damage
    return rand(1..6)
  end 

end 
