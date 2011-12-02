require 'unicode_utils'

class IngresosSepHts < ActiveRecord::Base 
  establish_connection :sep_iseries
  table_name="ingresos_sep_hts"

  def nombre_completo
    UnicodeUtils.titlecase(self.NOMPAC647A.strip)
  end

  def rut
    [self.RUTPAC647A, self.DIGPAC647A].join("-")
  end

  def prestacion
    self.DESPRE647A.strip
  end

  def cod_prestacion
    self.CODPRE647A
  end

  def self.ultima_carga
    tuc = tiempo_ultima_carga
    where(:fecpro647a => tuc[:fecha]).where(:horpro647a => tuc[:hora]).order("fecing647a desc, horing647a desc")
  end

  def self.ultimos_n(cuantos=1000)
    order("fecing647a desc, horing647a desc").limit(cuantos)
  end


  private

  def self.tiempo_ultima_carga 
    record=order("fecing647a desc, horing647a desc").limit(1)
    {:fecha => record.first.FECPRO647A,
     :hora => record.first.HORPRO647A
    }
  end
end
