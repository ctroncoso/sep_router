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

ActiveRecord::Schema.define(:version => 20111129185123) do

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

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.string   "rut"
    t.integer  "ingreso"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
