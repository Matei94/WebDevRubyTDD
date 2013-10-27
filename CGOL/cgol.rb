#!/usr/bin/ruby1.9.1

require 'set'

$no_neighbors = 8
$x_coord = [-1, -1, -1,  0, 0,  1, 1, 1]
$y_coord = [-1,  0,  1, -1, 1, -1, 0, 1]

class Cell < Struct.new(:x, :y)
end

def get_neighbors_stats(seed, cell)
	no_alive_neighbors = 0
	revived_neighbors = [].to_set
	
	$no_neighbors.times do |i|
		neighbor = Cell.new(cell.x + $x_coord[i], cell.y + $y_coord[i])
		
		if seed.include?(neighbor)
		
			no_alive_neighbors += 1
			
		else
		
			no_neighbors_of_neighbor = 0
			$no_neighbors.times do |j|
				neighbor_of_neighbor = Cell.new(neighbor.x + $x_coord[j], neighbor.y + $y_coord[j])
				no_neighbors_of_neighbor += 1 if seed.include?(neighbor_of_neighbor)
			end
			
			revived_neighbors << neighbor if no_neighbors_of_neighbor == 3
			
		end
		
	end
	
	return no_alive_neighbors, revived_neighbors
end

def evolve_universe(seed)
	to_add = [].to_set
	to_remove = [].to_set
	
	seed.each do |cell|
		no_alive_neighbors, revived_neighbors = get_neighbors_stats(seed, cell)
		to_add += revived_neighbors
		to_remove << cell if (no_alive_neighbors < 2 || no_alive_neighbors > 3)
 	end
 	
 	seed += to_add
 	seed -= to_remove
 	
 	return seed
end

seed = [Cell.new(0,0)].to_set
alive_cells_in_new_generation = evolve_universe(seed)

