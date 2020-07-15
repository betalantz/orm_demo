require 'pry'
require 'sqlite3'

DB = {
    conn: SQLite3::Database.new('db/twitter.db')
  }
  
  DB[:conn].results_as_hash = true

require_relative '../lib/tweet_app'
require_relative '../lib/tweet'
