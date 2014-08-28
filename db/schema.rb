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

ActiveRecord::Schema.define(version: 20140823154545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_adhistories", force: true do |t|
    t.string   "his_message"
    t.integer  "his_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_attributes", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 1024
    t.integer  "orderby",                  default: 0
    t.integer  "product_id",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_backup_restores", force: true do |t|
    t.string   "br_reason"
    t.integer  "br_userid"
    t.string   "br_note"
    t.integer  "br_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_banner_configs", force: true do |t|
    t.integer  "bn_speed"
    t.integer  "bn_pause"
    t.integer  "bn_width"
    t.integer  "bn_random"
    t.integer  "bn_max_large"
    t.integer  "bn_max_small"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_banners", force: true do |t|
    t.string   "lg_title",       limit: 512
    t.string   "lg_description", limit: 1024
    t.string   "lg_imageurl",    limit: 1024
    t.integer  "lg_type"
    t.string   "lg_btntitle",    limit: 512
    t.string   "lg_link",        limit: 1024
    t.integer  "lg_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bn_sortby",                   default: 0
  end

  create_table "admin_catalogues", force: true do |t|
    t.string   "name"
    t.integer  "parentid",                      default: 0
    t.string   "description",      limit: 1024
    t.string   "meta_keyword",     limit: 512
    t.string   "meta_description", limit: 512
    t.integer  "sort_order",                    default: 0
    t.integer  "status",                        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_coupon_histories", force: true do |t|
    t.integer  "coupon_id"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "c_amount"
    t.integer  "c_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_coupons", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "discount"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "is_login"
    t.integer  "is_free_ship"
    t.string   "apply_products"
    t.string   "apply_catalogues"
    t.integer  "max_times"
    t.integer  "max_times_cus"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discount_type",    default: 0
  end

  create_table "admin_mymailers", force: true do |t|
    t.string   "e_title"
    t.string   "e_address"
    t.integer  "e_port"
    t.string   "e_domain"
    t.string   "e_username"
    t.string   "e_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_products", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "discount"
    t.string   "description",      limit: 5000
    t.integer  "catid"
    t.string   "meta_keyword",     limit: 1024
    t.string   "meta_description", limit: 2048
    t.string   "tags"
    t.string   "model"
    t.integer  "quantity",                      default: 1
    t.string   "weight"
    t.string   "image",            limit: 512
    t.integer  "manufacturer"
    t.integer  "special",                       default: 0
    t.integer  "reward_point",                  default: 0
    t.integer  "is_view",                       default: 0
    t.integer  "is_buy",                        default: 0
    t.integer  "status",                        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arr_attr",         limit: 1024
  end

  create_table "admin_stores", force: true do |t|
    t.string   "s_name"
    t.string   "s_description", limit: 5000
    t.string   "s_address"
    t.string   "s_phone"
    t.string   "s_email"
    t.string   "s_logo"
    t.string   "s_acc_skype"
    t.string   "s_fb_title"
    t.string   "s_fb_name"
    t.string   "s_fb_link"
    t.string   "s_fb_appid"
    t.integer  "c_year"
    t.string   "c_link"
    t.string   "c_trade"
    t.string   "s_acc_tw"
    t.string   "s_sitemap"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_systemconfigs", force: true do |t|
    t.string  "currency"
    t.integer "rate"
    t.integer "number_bestbuy"
    t.integer "number_bestsell"
    t.integer "number_category"
    t.integer "is_viewer"
    t.integer "is_description"
    t.string  "google_access_id"
    t.string  "google_secret_key"
    t.string  "google_bucket"
    t.string  "google_analytic_id"
    t.string  "paypal_account"
    t.integer "number_spec_home",    default: 0
    t.integer "spec_home_rand",      default: 0
    t.integer "number_new_home",     default: 0
    t.integer "new_home_rand",       default: 0
    t.integer "number_spec_cat",     default: 0
    t.integer "spec_cat_rand",       default: 0
    t.integer "number_new_cat",      default: 0
    t.integer "new_cat_rand",        default: 0
    t.integer "number_same_product", default: 0
    t.integer "same_product_rand",   default: 0
    t.integer "banner_small",        default: 0
    t.integer "number_banner_small", default: 0
    t.integer "banner_small_rand",   default: 0
    t.integer "banner_big",          default: 0
    t.integer "number_banner_big",   default: 0
    t.integer "banner_big_rand",     default: 0
    t.integer "is_popup",            default: 0
    t.integer "popup_position",      default: 0
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.string   "address",                limit: 512
    t.string   "phone"
    t.integer  "status",                             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "admin_voucher_histories", force: true do |t|
    t.integer  "voucher_id"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "v_amount"
    t.integer  "v_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_vouchers", force: true do |t|
    t.string   "v_code"
    t.string   "from_name"
    t.string   "from_email"
    t.string   "to_name"
    t.string   "to_email"
    t.string   "v_messsage"
    t.string   "v_amount"
    t.integer  "v_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "cus_name"
    t.string   "cus_address",  limit: 1024
    t.string   "cus_phone"
    t.string   "cus_email"
    t.string   "cus_password"
    t.integer  "cus_points"
    t.string   "cus_image",    limit: 2048
    t.string   "cus_oauth",    limit: 1024
    t.integer  "cus_status",                default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mycompares", force: true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "myparameters", force: true do |t|
    t.string   "pr_name"
    t.string   "pr_type"
    t.string   "pr_value"
    t.integer  "pr_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.string  "product_name"
    t.integer "price"
    t.integer "discount"
    t.integer "qty",          default: 1
  end

  create_table "orders", force: true do |t|
    t.string   "cs_name"
    t.string   "cs_address"
    t.string   "cs_phone"
    t.string   "cs_email"
    t.text     "cs_note"
    t.integer  "cs_status"
    t.integer  "cs_sum"
    t.integer  "pay_kind"
    t.string   "url",        limit: 5000
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
