class InitSchema < ActiveRecord::Migration
  def up
    
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    
    create_table "mail_application_users", force: true do |t|
      t.integer  "mail_application_id"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "creator"
    end
    
    create_table "mail_applications", force: true do |t|
      t.string   "name"
      t.string   "password"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "creator_id"
      t.string   "state"
      t.datetime "last_message_at"
    end
    
    create_table "mail_messages", force: true do |t|
      t.string   "recipient"
      t.string   "sender"
      t.text     "data"
      t.datetime "completed_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "mail_application_id"
      t.string   "state"
      t.text     "subject"
    end
    
    add_index "mail_messages", ["mail_application_id"], name: "index_mail_messages_on_mail_application_id", using: :btree
    
    create_table "user_authentications", force: true do |t|
      t.integer  "user_id"
      t.string   "uid"
      t.string   "provider"
      t.string   "nickname"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_index "user_authentications", ["user_id"], name: "index_user_authentications_on_user_id", using: :btree
    
    create_table "user_facebook", force: true do |t|
      t.integer  "user_id"
      t.string   "uid"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "nickname"
      t.string   "email"
    end
    
    add_index "user_facebook", ["uid"], name: "index_user_facebook_on_uid", using: :btree
    add_index "user_facebook", ["user_id"], name: "index_user_facebook_on_user_id", using: :btree
    
    create_table "user_github", force: true do |t|
      t.integer  "user_id"
      t.string   "uid"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "nickname"
      t.string   "email"
    end
    
    add_index "user_github", ["uid"], name: "index_user_github_on_uid", using: :btree
    add_index "user_github", ["user_id"], name: "index_user_github_on_user_id", using: :btree
    
    create_table "users", force: true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "admin"
      t.string   "email"
      t.string   "password_digest"
      t.string   "state"
      t.string   "confirmation_token"
      t.string   "reset_password_token"
    end
    
    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
    
  end

  def down
    raise "Can not revert initial migration"
  end
end
