class Building < ApplicationRecord
    has_many :apartments, dependent: :destroy
    accepts_nested_attributes_for   :apartments, 
                                    allow_destroy: true, # permite eliminar la relacion entre el modelo y el nested enviando el metodo _destroy en el hash de params
                                    reject_if: proc { |attributes| attributes['number'].blank? } # evita que el nested se guarde si ciertos atributos vienen en blanco

    def to_s
        self.name
    end
end
