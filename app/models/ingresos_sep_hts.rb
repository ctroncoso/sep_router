require 'unicode_utils'

class IngresosSepHts < ActiveRecord::Base 
  establish_connection :sep_iseries
  table_name="ingresos_sep_hts"

  # Atributos virtuales 
  
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
    (self.TIPPRE647A.to_i * 1000000000) + self.CODPRE647A
  end

  def ingreso
    self.FECING647A + self.HORING647A.seconds_since_midnight.seconds
  end
  
  # END Atributos virtuales
  # -----------------------

  # listado de exámenes para un paciente
  # parámetros: hash de paciente
  # devuelve: array de [prestación, nombre_prestación]
  def self.examenes(pax_hash=nil)
    # FIXME please refactor. Priority Low.
    if pax_hash
      pax_hash[:fecha_ingreso]= pax_hash[:started_at].to_date
      pax_hash[:hora_ingreso]=Time.parse("20000101") + pax_hash[:started_at].seconds_since_midnight
      pax_hash[:rut] = pax_hash[:rut].split("-")[0]
      records = find_all_by_RUTPAC647A_and_FECING647A_and_HORING647A( pax_hash[:rut], pax_hash[:fecha_ingreso], pax_hash[:hora_ingreso].strftime("%X") )
    else
      records = ultima_carga 
    end
    records.map { |r| {:exam_name => r.prestacion, :prestacion_id => r.cod_prestacion} }.uniq
  end

  def self.ultima_carga
    tuc = tiempo_ultima_carga
    where(:fecpro647a => tuc[:fecha]).where("horpro647a >= ?",tuc[:hora]).order("fecing647a desc, horing647a desc")
  end

  def self.ultimos_n(cuantos=1000)
    order("fecing647a desc, horing647a desc").limit(cuantos)
  end


  private

  def self.tiempo_ultima_carga 
    record=order("fecing647a desc, horing647a desc").limit(1)
    {:fecha => record.first.FECPRO647A,
     :hora => params[:today]==full ? Time.now.midnight : (record.first.HORPRO647A - 10.minutes)
    }
  end
end
