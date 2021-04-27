class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(dmg)
    @life_points = @life_points - dmg

    if @life_points <= 0
      puts "#{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage = compute_damage
    player.gets_damage(damage)
    puts "il lui inflige #{damage} points de dommages"
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

  def show_state2
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    x = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{x}"
    if @weapon_level < x
      @weapon_level = @weapon_level + x
      puts "Youhou ! Elle est meilleure que ton arme actuelle: tu la prends."
    else puts "Shit...elle n'est pas mieux que ton arme actuelle.."
    end
  end

  def search_health_pack
    y = rand(1..6)
    if y == 1 
      puts "Tu n'as rien trouvé"
    if y == 2..5 *10
      @life_points + rand <= 100
      puts "Bravo, tu as trouvé un pack de + #{y} points de vie !"
    else y == 6 * 12
      @life_points + rand <= 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
  end
end