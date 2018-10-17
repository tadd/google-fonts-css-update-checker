require 'digest'
require 'rest-client'

BUILD_HOOK = -ENV.fetch('BUILD_HOOK')
FAMILY = -ENV.fetch('FAMILY')
BASE = -'https://fonts.googleapis.com/css?family='

def main
  css = get(BASE + FAMILY)
  digest = sha256(css)
  if updated?(digest)
    save(digest, Time.now)
    notify(BUILD_HOOK)
  end
end

def get(url)
  RestClinet.get(url)
end

def sha256(css)
  Digest::SHA256.hexdigest(css)
end

def updated?(digest)
  digest != latest_digest
end

def latest_digest
  # todo: use pg natively?
end

def save(digest, created_at)
end

def notify(hook)
 RestClient.post(hook, '') # just for netlify
end

main if $0 == __FILE__
