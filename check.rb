require 'digest'
require 'active_record'
require 'rest-client'

BUILD_HOOK = -ENV.fetch('BUILD_HOOK')
FAMILY = -ENV.fetch('FAMILY')
DATABASE_URL = -ENV.fetch('DATABASE_URL')

BASE = -'https://fonts.googleapis.com/css?family='
REQUEST_HEADERS = {
  'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36' # Chromium 69
}.freeze

class FileDigest < ActiveRecord::Base; end

def main
  resp = get(BASE + FAMILY)
  digest = sha256(resp.body)
  if updated?(digest)
    save(digest)
    notify(BUILD_HOOK)
  end
end

def get(url)
  RestClient.get(url, REQUEST_HEADERS)
end

def sha256(css)
  Digest::SHA256.hexdigest(css)
end

def updated?(digest)
  digest != latest_digest
end

def latest_digest
  ActiveRecord::Base.establish_connection(DATABASE_URL)
  FileDigest.last&.digest
end

def save(digest)
  FileDigest.create(digest: digest)
end

def notify(hook)
  RestClient.post(hook, '') # just for netlify
end

main if $0 == __FILE__
