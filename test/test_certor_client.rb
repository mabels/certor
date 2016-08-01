require 'json'
require 'net/http'


res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  uri = URI(ARGV[3]||'http://localhost:4711')
  req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
  req.body = JSON.generate( {
    hostname => ARGV[1],
    csr => IO.read(ARGV[2])
  })
  http.request(req)
end

