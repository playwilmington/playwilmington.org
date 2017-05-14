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

ActiveRecord::Schema.define(version: 20170513135730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content",    default: ""
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "card_groups", force: :cascade do |t|
    t.integer  "page_id"
    t.string   "grid"
    t.boolean  "active"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "usage_type"
    t.index ["page_id"], name: "index_card_groups_on_page_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "title"
    t.text     "card_content"
    t.text     "card_reveal"
    t.integer  "order"
    t.boolean  "active"
    t.string   "size"
    t.boolean  "sticky_links"
    t.string   "btn_one_name"
    t.string   "btn_one_url"
    t.string   "btn_two_name"
    t.string   "btn_two_url"
    t.integer  "card_group_id"
    t.string   "card_image_file_name"
    t.string   "card_image_content_type"
    t.integer  "card_image_file_size"
    t.datetime "card_image_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "toggle_title"
    t.index ["card_group_id"], name: "index_cards_on_card_group_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "collapsible_items", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "active"
    t.string   "icon"
    t.integer  "order"
    t.integer  "collapsible_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["collapsible_id"], name: "index_collapsible_items_on_collapsible_id", using: :btree
  end

  create_table "collapsibles", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",         default: false
    t.boolean  "is_popout",      default: false
    t.string   "collapse_style", default: "accordion"
    t.string   "usage_type"
    t.integer  "order"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "page_id"
    t.index ["page_id"], name: "index_collapsibles_on_page_id", using: :btree
  end

  create_table "collections", force: :cascade do |t|
    t.string   "title"
    t.integer  "order"
    t.string   "icon"
    t.string   "link"
    t.boolean  "is_header"
    t.boolean  "active"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_collections_on_page_id", using: :btree
  end

  create_table "contact_emails", force: :cascade do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "email_address"
    t.boolean  "active"
    t.integer  "order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["page_id"], name: "index_contact_emails_on_page_id", using: :btree
  end

  create_table "exhibits", force: :cascade do |t|
    t.string   "title"
    t.string   "icon"
    t.string   "description"
    t.integer  "page_id"
    t.boolean  "active"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["page_id"], name: "index_exhibits_on_page_id", using: :btree
  end

  create_table "markers", force: :cascade do |t|
    t.string   "address"
    t.string   "title"
    t.text     "body"
    t.string   "marker_type"
    t.integer  "page_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["page_id"], name: "index_markers_on_page_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.text     "content"
    t.string   "title",                             null: false
    t.string   "icon"
    t.string   "page_type"
    t.integer  "page_id"
    t.integer  "order"
    t.string   "name",                              null: false
    t.boolean  "active"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "show_calendar"
    t.boolean  "hide_title"
    t.boolean  "show_contact"
    t.boolean  "show_testimonials", default: false
    t.index ["name"], name: "index_pages_on_name", unique: true, using: :btree
    t.index ["page_id"], name: "index_pages_on_page_id", using: :btree
  end

  create_table "photo_albums", force: :cascade do |t|
    t.string   "title"
    t.integer  "page_id"
    t.integer  "order"
    t.boolean  "active",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["page_id"], name: "index_photo_albums_on_page_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "photo_album_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["photo_album_id"], name: "index_photos_on_photo_album_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.string   "address"
    t.string   "company_name"
    t.string   "copyright"
    t.string   "email"
    t.string   "phone"
    t.string   "facebook_handle"
    t.string   "twitter_handle"
    t.string   "pinterest_handle"
    t.string   "instagram_handle"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "donation_url"
    t.text     "calendar_help_text"
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "order"
    t.string   "position"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "active"
    t.string   "color",              default: "white"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "name"
    t.text     "quote"
    t.string   "status",     default: "New"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
