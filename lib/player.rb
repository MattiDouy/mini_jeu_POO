
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name 
    @life_points = 10
  end 

  def show_state
    return "#{@name} à #{@life_points} points de vie"
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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    
    @weapon_level = 1
    super(name)
    @life_points = 100
  end 

  def show_state
    print "#{@name} à #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end 

  def compute_damage
    rand(1..6) * @weapon_level
  end 

  def search_weapon
    level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{level}"
    if level > @weapon_level
      @weapon_level = level
      puts "Youhou elle est meilleur que ton arme actuelle : tu la prends."
    elsif level <= @weapon_level
      puts "Fichtre, pas mieux que l'actuelle.."
    end  
  end 

  def search_health_pack
    dice = rand(1..6)
    if dice == 1 
      puts "Tu n'as rien trouvé..."
    elsif dice.between?(2,5)
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end 
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif dice == 6
      @life_points += 80
      if @life_points > 100
        @life_points == 100
      end 
      puts "Waaooow, tu as trouvé un pack de +80 points de vie !!"
    end 
  end 
end