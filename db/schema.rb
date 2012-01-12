# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120112185210) do

  create_table "colas", :force => true do |t|
    t.integer  "prestacion_id"
    t.integer  "exam_id"
    t.datetime "encolado_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "prestacion_id", :limit => 8
    t.text     "exam_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingresos_sep_historicos", :id => false, :force => true do |t|
    t.string  "AGENCI647A", :limit => 80
    t.string  "CENASI647A", :limit => 80
    t.integer "RUTEMP647A"
    t.string  "DIGEMP647A", :limit => 80
    t.string  "NOMEMP647A", :limit => 80
    t.integer "RUTPAC647A",               :default => 0, :null => false
    t.string  "DIGPAC647A", :limit => 80
    t.integer "INGRES647A"
    t.integer "NROCON647A"
    t.string  "NOMPAC647A", :limit => 80
    t.integer "EDADDD647A"
    t.string  "UNIDAD647A", :limit => 80
    t.string  "DESPRE647A", :limit => 80
    t.integer "VALLOC647A"
    t.integer "VALNAC647A"
    t.date    "FECING647A",                              :null => false
    t.string  "HORING647A", :limit => 20,                :null => false
    t.date    "FECINF647A"
    t.integer "RUTEVA647A"
    t.string  "NOMEVA647A", :limit => 80
    t.integer "COCONC647A",               :default => 0, :null => false
    t.string  "DESCON647A", :limit => 80
    t.integer "FOLIO1647A"
    t.integer "FOLIO2647A"
    t.integer "TIPOEV647A"
    t.string  "TIPOED647A", :limit => 80
    t.integer "CODCOM647A"
    t.string  "DESCOM647A", :limit => 80
    t.string  "RIESG1647A", :limit => 80
    t.string  "CONDI1647A", :limit => 80
    t.string  "RIESG2647A", :limit => 80
    t.string  "CONDI2647A", :limit => 80
    t.string  "RIESG3647A", :limit => 80
    t.string  "CONDI3647A", :limit => 80
    t.string  "BATER1647A", :limit => 80
    t.string  "BATER2647A", :limit => 80
    t.string  "BATER3647A", :limit => 80
    t.string  "BATER4647A", :limit => 80
    t.string  "BATER5647A", :limit => 80
    t.integer "NUEVAL647A"
    t.integer "CODPRE647A",               :default => 0, :null => false
    t.string  "TIPPRE647A", :limit => 80
    t.string  "CENCOS647A", :limit => 80
    t.date    "FECDES647A"
    t.date    "FECHAS647A"
    t.date    "FECPRO647A"
    t.time    "HORPRO647A"
    t.integer "mes",                                     :null => false
  end

  create_table "ingresos_sep_hts", :id => false, :force => true do |t|
    t.string  "AGENCI647A", :limit => 80
    t.string  "CENASI647A", :limit => 80
    t.integer "RUTEMP647A"
    t.string  "DIGEMP647A", :limit => 80
    t.string  "NOMEMP647A", :limit => 80
    t.integer "RUTPAC647A",               :default => 0,                     :null => false
    t.string  "DIGPAC647A", :limit => 80
    t.integer "INGRES647A"
    t.integer "NROCON647A"
    t.string  "NOMPAC647A", :limit => 80
    t.integer "EDADDD647A"
    t.string  "UNIDAD647A", :limit => 80
    t.string  "DESPRE647A", :limit => 80
    t.integer "VALLOC647A"
    t.integer "VALNAC647A"
    t.date    "FECING647A",                                                  :null => false
    t.time    "HORING647A",               :default => '2000-01-01 00:00:00', :null => false
    t.date    "FECINF647A"
    t.integer "RUTEVA647A"
    t.string  "NOMEVA647A", :limit => 80
    t.integer "COCONC647A",               :default => 0,                     :null => false
    t.string  "DESCON647A", :limit => 80
    t.integer "FOLIO1647A"
    t.integer "FOLIO2647A"
    t.integer "TIPOEV647A"
    t.string  "TIPOED647A", :limit => 80
    t.integer "CODCOM647A"
    t.string  "DESCOM647A", :limit => 80
    t.string  "RIESG1647A", :limit => 80
    t.string  "CONDI1647A", :limit => 80
    t.string  "RIESG2647A", :limit => 80
    t.string  "CONDI2647A", :limit => 80
    t.string  "RIESG3647A", :limit => 80
    t.string  "CONDI3647A", :limit => 80
    t.string  "BATER1647A", :limit => 80
    t.string  "BATER2647A", :limit => 80
    t.string  "BATER3647A", :limit => 80
    t.string  "BATER4647A", :limit => 80
    t.string  "BATER5647A", :limit => 80
    t.integer "NUEVAL647A"
    t.integer "CODPRE647A",               :default => 0,                     :null => false
    t.string  "TIPPRE647A", :limit => 80
    t.string  "CENCOS647A", :limit => 80
    t.date    "FECDES647A"
    t.date    "FECHAS647A"
    t.date    "FECPRO647A"
    t.time    "HORPRO647A"
  end

  add_index "ingresos_sep_hts", ["FECING647A", "HORING647A"], :name => "ingreso"
  add_index "ingresos_sep_hts", ["FECPRO647A", "HORPRO647A"], :name => "procesamiento"

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.string   "rut"
    t.integer  "ingreso"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "processed"
    t.string   "rut_empresa"
  end

  create_table "prestaciones", :force => true do |t|
    t.integer  "cod_prestacion",    :limit => 8
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "punto_servicio_id"
  end

  create_table "prestaciones_old", :id => false, :force => true do |t|
    t.integer "codpre647a", :limit => 8,  :default => 0, :null => false
    t.string  "despre647a", :limit => 80
  end

  create_table "punto_servicios", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tmp_ingresos_sep_hts", :id => false, :force => true do |t|
    t.string "AGENCI647A", :limit => 80
    t.string "CENASI647A", :limit => 80
    t.string "RUTEMP647A", :limit => 80
    t.string "DIGEMP647A", :limit => 80
    t.string "NOMEMP647A", :limit => 80
    t.string "RUTPAC647A", :limit => 80
    t.string "DIGPAC647A", :limit => 80
    t.string "INGRES647A", :limit => 80
    t.string "NROCON647A", :limit => 80
    t.string "NOMPAC647A", :limit => 80
    t.string "EDADDD647A", :limit => 80
    t.string "UNIDAD647A", :limit => 80
    t.string "DESPRE647A", :limit => 80
    t.string "VALLOC647A", :limit => 80
    t.string "VALNAC647A", :limit => 80
    t.string "FECING647A", :limit => 80
    t.string "HORING647A", :limit => 80
    t.string "FECINF647A", :limit => 80
    t.string "RUTEVA647A", :limit => 80
    t.string "NOMEVA647A", :limit => 80
    t.string "COCONC647A", :limit => 80
    t.string "DESCON647A", :limit => 80
    t.string "FOLIO1647A", :limit => 80
    t.string "FOLIO2647A", :limit => 80
    t.string "TIPOEV647A", :limit => 80
    t.string "TIPOED647A", :limit => 80
    t.string "CODCOM647A", :limit => 80
    t.string "DESCOM647A", :limit => 80
    t.string "RIESG1647A", :limit => 80
    t.string "CONDI1647A", :limit => 80
    t.string "RIESG2647A", :limit => 80
    t.string "CONDI2647A", :limit => 80
    t.string "RIESG3647A", :limit => 80
    t.string "CONDI3647A", :limit => 80
    t.string "BATER1647A", :limit => 80
    t.string "BATER2647A", :limit => 80
    t.string "BATER3647A", :limit => 80
    t.string "BATER4647A", :limit => 80
    t.string "BATER5647A", :limit => 80
    t.string "NUEVAL647A", :limit => 80
    t.string "CODPRE647A", :limit => 80
    t.string "TIPPRE647A", :limit => 80
    t.string "CENCOS647A", :limit => 80
    t.string "FECDES647A", :limit => 80
    t.string "FECHAS647A", :limit => 80
    t.string "FECPRO647A", :limit => 80
    t.string "HORPRO647A", :limit => 80
  end

end
