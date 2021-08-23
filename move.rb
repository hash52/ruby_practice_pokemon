require 'csv'

require './type'

class Move
    include Type
    attr_reader :name, :type, :damage

    def self.find id
        CSV.foreach "data/moves.csv", headers: true do |row|
            if row["id"].to_i == id
                return new(row["name"],row["type"].to_i,row["damage"].to_i)
            end
        end
    end

    def initialize name, type, damage
        @name = name
        @type = type
        @damage = damage
    end
end