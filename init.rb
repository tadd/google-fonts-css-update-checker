require 'active_record'

DATABASE_URL = -ENV.fetch('DATABASE_URL')

def create_table
  ActiveRecord::Base.establish_connection(DATABASE_URL)
  conn = ActiveRecord::Base.connection
  conn.create_table(:file_digests) do |t|
    t.string :digest
    t.timestamps
  end
end

create_table if $0 == __FILE__
