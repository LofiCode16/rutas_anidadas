class Apartment < ApplicationRecord
    belongs_to :building

    def address
        "#{self.building.address} dpto. #{self.number}"
    end
end
