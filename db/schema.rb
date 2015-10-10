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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150801161704) do

  create_table "ahoy_events", force: :cascade do |t|
    t.uuid     "visit_id",   limit: 16
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "properties", limit: 65535
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "favouriteable_type", limit: 255
    t.integer  "favouriteable_id",   limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "homepage_sliders", force: :cascade do |t|
    t.integer  "site_configuration_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image_file_name",       limit: 255
    t.string   "image_content_type",    limit: 255
    t.integer  "image_file_size",       limit: 4
    t.datetime "image_updated_at"
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type", limit: 255
    t.integer  "impressionable_id",   limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "controller_name",     limit: 255
    t.string   "action_name",         limit: 255
    t.string   "view_name",           limit: 255
    t.string   "request_hash",        limit: 255
    t.string   "ip_address",          limit: 255
    t.string   "session_hash",        limit: 255
    t.text     "message",             limit: 65535
    t.text     "referrer",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "landings", force: :cascade do |t|
    t.string   "title",                 limit: 255
    t.string   "slug",                  limit: 255
    t.string   "main_heading",          limit: 255
    t.string   "sub_heading",           limit: 255
    t.text     "description",           limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "bg_image_file_name",    limit: 255
    t.string   "bg_image_content_type", limit: 255
    t.integer  "bg_image_file_size",    limit: 4
    t.datetime "bg_image_updated_at"
    t.string   "landing_type",          limit: 255
  end

  create_table "listing_images", force: :cascade do |t|
    t.string  "imageable_type", limit: 255
    t.integer "imageable_id",   limit: 4
    t.string  "image_src",      limit: 255
  end

  create_table "listings", force: :cascade do |t|
    t.string   "a_c",                   limit: 100
    t.string   "acres",                 limit: 100
    t.text     "ad_text",               limit: 65535
    t.string   "addr",                  limit: 100
    t.string   "all_inc",               limit: 100
    t.string   "apt_num",               limit: 100
    t.string   "area",                  limit: 100
    t.string   "area_code",             limit: 100
    t.integer  "ass_year",              limit: 4
    t.integer  "bath_tot",              limit: 2
    t.integer  "br",                    limit: 1
    t.integer  "br_plus",               limit: 1
    t.string   "bsmt1_out",             limit: 100
    t.string   "bsmt2_out",             limit: 100
    t.string   "cable",                 limit: 100
    t.string   "cac_inc",               limit: 100
    t.string   "central_vac",           limit: 100
    t.string   "cert_lvl",              limit: 100
    t.string   "comel_inc",             limit: 100
    t.string   "community",             limit: 100
    t.string   "community_code",        limit: 100
    t.string   "comp_pts",              limit: 100
    t.string   "constr1_out",           limit: 100
    t.string   "constr2_out",           limit: 100
    t.string   "county",                limit: 100
    t.string   "cross_st",              limit: 255
    t.string   "den_fr",                limit: 100
    t.decimal  "depth",                               precision: 6, scale: 2
    t.string   "disp_addr",             limit: 100
    t.integer  "DOM",                   limit: 8
    t.string   "drive",                 limit: 100
    t.string   "elec",                  limit: 100
    t.string   "elevator",              limit: 100
    t.string   "energy_cert",           limit: 100
    t.text     "extras",                limit: 65535
    t.string   "farm_agri",             limit: 100
    t.string   "fpl_num",               limit: 100
    t.decimal  "front_ft",                            precision: 8, scale: 2
    t.string   "fuel",                  limit: 100
    t.string   "furnished",             limit: 100
    t.integer  "gar_spaces",            limit: 3
    t.string   "gar_type",              limit: 100
    t.string   "gas",                   limit: 100
    t.string   "green_pis",             limit: 100
    t.string   "handi_equipped",        limit: 100
    t.string   "heat_inc",              limit: 100
    t.string   "heating",               limit: 100
    t.string   "hydro_inc",             limit: 100
    t.string   "irreg",                 limit: 100
    t.integer  "kit_plus",              limit: 1
    t.string   "laundry",               limit: 100
    t.string   "laundry_lev",           limit: 100
    t.string   "lease_term",            limit: 100
    t.string   "level1",                limit: 100
    t.string   "level10",               limit: 100
    t.string   "level11",               limit: 100
    t.string   "level12",               limit: 100
    t.string   "level2",                limit: 100
    t.string   "level3",                limit: 100
    t.string   "level4",                limit: 100
    t.string   "level5",                limit: 100
    t.string   "level6",                limit: 100
    t.string   "level7",                limit: 100
    t.string   "level8",                limit: 100
    t.string   "level9",                limit: 100
    t.string   "lotsz_code",            limit: 100
    t.integer  "lp_dol",                limit: 4
    t.string   "ml_num",                limit: 100
    t.integer  "mmap_col",              limit: 2
    t.integer  "mmap_page",             limit: 3
    t.string   "mmap_row",              limit: 100
    t.string   "municipality",          limit: 100
    t.string   "municipality_code",     limit: 100
    t.string   "municipality_district", limit: 100
    t.integer  "num_kit",               limit: 1
    t.string   "occ",                   limit: 100
    t.string   "oth_struc1_out",        limit: 100
    t.string   "oth_struc2_out",        limit: 100
    t.string   "outof_area",            limit: 100
    t.string   "parcel_id",             limit: 100
    t.integer  "park_chgs",             limit: 8
    t.integer  "park_spcs",             limit: 3
    t.string   "pay_freq",              limit: 100
    t.datetime "pix_updt"
    t.string   "pool",                  limit: 100
    t.string   "prkg_inc",              limit: 100
    t.string   "prop_feat1_out",        limit: 100
    t.string   "prop_feat2_out",        limit: 100
    t.string   "prop_feat3_out",        limit: 100
    t.string   "prop_feat4_out",        limit: 100
    t.string   "prop_feat5_out",        limit: 100
    t.string   "prop_feat6_out",        limit: 100
    t.string   "pvt_ent",               limit: 100
    t.string   "retirement",            limit: 100
    t.string   "rltr",                  limit: 100
    t.string   "rm1_dc1_out",           limit: 100
    t.string   "rm1_dc2_out",           limit: 100
    t.string   "rm1_dc3_out",           limit: 100
    t.integer  "rm1_len",               limit: 8
    t.string   "rm1_out",               limit: 100
    t.integer  "rm1_wth",               limit: 8
    t.string   "rm10_dc1_out",          limit: 100
    t.string   "rm10_dc2_out",          limit: 100
    t.string   "rm10_dc3_out",          limit: 100
    t.integer  "rm10_len",              limit: 8
    t.string   "rm10_out",              limit: 100
    t.integer  "rm10_wth",              limit: 8
    t.string   "rm11_dc1_out",          limit: 100
    t.string   "rm11_dc2_out",          limit: 100
    t.string   "rm11_dc3_out",          limit: 100
    t.integer  "rm11_len",              limit: 8
    t.string   "rm11_out",              limit: 100
    t.integer  "rm11_wth",              limit: 8
    t.string   "rm12_dc1_out",          limit: 100
    t.string   "rm12_dc2_out",          limit: 100
    t.string   "rm12_dc3_out",          limit: 100
    t.integer  "rm12_len",              limit: 8
    t.string   "rm12_out",              limit: 100
    t.integer  "rm12_wth",              limit: 8
    t.string   "rm2_dc1_out",           limit: 100
    t.string   "rm2_dc2_out",           limit: 100
    t.string   "rm2_dc3_out",           limit: 100
    t.integer  "rm2_len",               limit: 8
    t.string   "rm2_out",               limit: 100
    t.integer  "rm2_wth",               limit: 8
    t.string   "rm3_dc1_out",           limit: 100
    t.string   "rm3_dc2_out",           limit: 100
    t.string   "rm3_dc3_out",           limit: 100
    t.integer  "rm3_len",               limit: 8
    t.string   "rm3_out",               limit: 100
    t.integer  "rm3_wth",               limit: 8
    t.string   "rm4_dc1_out",           limit: 100
    t.string   "rm4_dc2_out",           limit: 100
    t.string   "rm4_dc3_out",           limit: 100
    t.integer  "rm4_len",               limit: 8
    t.string   "rm4_out",               limit: 100
    t.integer  "rm4_wth",               limit: 8
    t.string   "rm5_dc1_out",           limit: 100
    t.string   "rm5_dc2_out",           limit: 100
    t.string   "rm5_dc3_out",           limit: 100
    t.integer  "rm5_len",               limit: 8
    t.string   "rm5_out",               limit: 100
    t.integer  "rm5_wth",               limit: 8
    t.string   "rm6_dc1_out",           limit: 100
    t.string   "rm6_dc2_out",           limit: 100
    t.string   "rm6_dc3_out",           limit: 100
    t.integer  "rm6_len",               limit: 8
    t.string   "rm6_out",               limit: 100
    t.integer  "rm6_wth",               limit: 8
    t.string   "rm7_dc1_out",           limit: 100
    t.string   "rm7_dc2_out",           limit: 100
    t.string   "rm7_dc3_out",           limit: 100
    t.integer  "rm7_len",               limit: 8
    t.string   "rm7_out",               limit: 100
    t.integer  "rm7_wth",               limit: 8
    t.string   "rm8_dc1_out",           limit: 100
    t.string   "rm8_dc2_out",           limit: 100
    t.string   "rm8_dc3_out",           limit: 100
    t.integer  "rm8_len",               limit: 8
    t.string   "rm8_out",               limit: 100
    t.integer  "rm8_wth",               limit: 8
    t.string   "rm9_dc1_out",           limit: 100
    t.string   "rm9_dc2_out",           limit: 100
    t.string   "rm9_dc3_out",           limit: 100
    t.integer  "rm9_len",               limit: 8
    t.string   "rm9_out",               limit: 100
    t.integer  "rm9_wth",               limit: 8
    t.integer  "rms",                   limit: 2
    t.integer  "rooms_plus",            limit: 1
    t.string   "s_r",                   limit: 100
    t.string   "sewer",                 limit: 100
    t.string   "spec_des1_out",         limit: 100
    t.string   "spec_des2_out",         limit: 100
    t.string   "spec_des3_out",         limit: 100
    t.string   "spec_des4_out",         limit: 100
    t.string   "spec_des5_out",         limit: 100
    t.string   "spec_des6_out",         limit: 100
    t.string   "sqft",                  limit: 100
    t.string   "st",                    limit: 100
    t.string   "st_dir",                limit: 100
    t.string   "st_num",                limit: 100
    t.string   "st_sfx",                limit: 100
    t.string   "status",                limit: 100
    t.string   "style",                 limit: 100
    t.integer  "taxes",                 limit: 8
    t.string   "timestamp",             limit: 100
    t.datetime "timestamp_sql"
    t.integer  "tv",                    limit: 8
    t.string   "type_own_srch",         limit: 100
    t.string   "type_own1_out",         limit: 100
    t.string   "uffi",                  limit: 100
    t.string   "util_cable",            limit: 100
    t.string   "util_tel",              limit: 100
    t.string   "vend_pis",              limit: 100
    t.string   "water",                 limit: 100
    t.string   "water_inc",             limit: 100
    t.string   "waterfront",            limit: 100
    t.integer  "wcloset_p1",            limit: 1
    t.integer  "wcloset_p2",            limit: 1
    t.integer  "wcloset_p3",            limit: 1
    t.integer  "wcloset_p4",            limit: 1
    t.integer  "wcloset_p5",            limit: 1
    t.integer  "wcloset_t1",            limit: 1
    t.string   "wcloset_t1lvl",         limit: 100
    t.integer  "wcloset_t2",            limit: 1
    t.string   "wcloset_t2lvl",         limit: 100
    t.integer  "wcloset_t3",            limit: 1
    t.string   "wcloset_t3lvl",         limit: 100
    t.integer  "wcloset_t4",            limit: 1
    t.string   "wcloset_t4lvl",         limit: 100
    t.integer  "wcloset_t5",            limit: 1
    t.string   "wcloset_t5lvl",         limit: 100
    t.string   "wtr_suptyp",            limit: 100
    t.integer  "yr",                    limit: 4
    t.string   "yr_built",              limit: 100
    t.string   "zip",                   limit: 100
    t.string   "zoning",                limit: 100
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.float    "latitude",              limit: 24
    t.float    "longitude",             limit: 24
    t.datetime "deleted_at"
    t.text     "fields_to_show",        limit: 65535
    t.string   "share_perc",            limit: 100
    t.string   "patio_ter",             limit: 100
    t.string   "bldg_amen1_out",        limit: 100
    t.string   "bldg_amen2_out",        limit: 100
    t.string   "bldg_amen3_out",        limit: 100
    t.string   "bldg_amen4_out",        limit: 100
    t.string   "bldg_amen5_out",        limit: 100
    t.string   "bldg_amen6_out",        limit: 100
    t.string   "insur_bldg",            limit: 100
    t.integer  "corp_num",              limit: 4
    t.string   "condo_corp",            limit: 100
    t.string   "cond_txinc",            limit: 100
    t.string   "ens_lndry",             limit: 100
    t.string   "condo_exp",             limit: 100
    t.integer  "gar",                   limit: 4
    t.string   "stories",               limit: 100
    t.string   "locker",                limit: 100
    t.string   "locker_num",            limit: 100
    t.integer  "maint",                 limit: 4
    t.string   "park_lgl_desc1",        limit: 100
    t.string   "park_lgl_desc2",        limit: 100
    t.string   "park_spc1",             limit: 100
    t.string   "park_spc2",             limit: 100
    t.string   "park_desig",            limit: 100
    t.string   "park_desig_2",          limit: 100
    t.string   "park_fac",              limit: 100
    t.string   "pets",                  limit: 100
    t.string   "prop_mgmt",             limit: 100
    t.string   "unit_num",              limit: 100
    t.string   "listing_type",          limit: 100
    t.string   "visibility",            limit: 100
    t.boolean  "featured",              limit: 1
    t.integer  "listing_images_count",  limit: 4
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id",   limit: 4
    t.string  "unsubscriber_type", limit: 255
    t.integer "conversation_id",   limit: 4
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body",                 limit: 65535
    t.string   "subject",              limit: 255,   default: ""
    t.integer  "sender_id",            limit: 4
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id",      limit: 4
    t.boolean  "draft",                limit: 1,     default: false
    t.string   "notification_code",    limit: 255
    t.integer  "notified_object_id",   limit: 4
    t.string   "notified_object_type", limit: 255
    t.string   "attachment",           limit: 255
    t.datetime "updated_at",                                         null: false
    t.datetime "created_at",                                         null: false
    t.boolean  "global",               limit: 1,     default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id",     limit: 4
    t.string   "receiver_type",   limit: 255
    t.integer  "notification_id", limit: 4,                   null: false
    t.boolean  "is_read",         limit: 1,   default: false
    t.boolean  "trashed",         limit: 1,   default: false
    t.boolean  "deleted",         limit: 1,   default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "prospect_matches", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "city",           limit: 255
    t.string   "property_types", limit: 255
    t.integer  "min_price",      limit: 4
    t.integer  "max_price",      limit: 4
    t.string   "beds",           limit: 255
    t.string   "baths",          limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "site_configurations", force: :cascade do |t|
    t.float    "rebate_percent",  limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "privacy_content", limit: 65535
    t.text     "terms_content",   limit: 65535
    t.text     "cookies_content", limit: 65535
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "faye_token",             limit: 255
    t.string   "address",                limit: 255
    t.string   "city",                   limit: 255
    t.string   "province",               limit: 255
    t.string   "country",                limit: 255
    t.string   "postal_code",            limit: 255
    t.string   "phone_number",           limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.boolean  "unsubscribe_all",        limit: 1
    t.boolean  "newsletter_subscribed",  limit: 1
    t.boolean  "admin",                  limit: 1
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.uuid     "visitor_id",       limit: 16
    t.string   "ip",               limit: 255
    t.text     "user_agent",       limit: 65535
    t.text     "referrer",         limit: 65535
    t.text     "landing_page",     limit: 65535
    t.integer  "user_id",          limit: 4
    t.string   "referring_domain", limit: 255
    t.string   "search_keyword",   limit: 255
    t.string   "browser",          limit: 255
    t.string   "os",               limit: 255
    t.string   "device_type",      limit: 255
    t.integer  "screen_height",    limit: 4
    t.integer  "screen_width",     limit: 4
    t.string   "country",          limit: 255
    t.string   "region",           limit: 255
    t.string   "city",             limit: 255
    t.string   "utm_source",       limit: 255
    t.string   "utm_medium",       limit: 255
    t.string   "utm_term",         limit: 255
    t.string   "utm_content",      limit: 255
    t.string   "utm_campaign",     limit: 255
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
