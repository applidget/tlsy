
net = require 'net'
url = require 'url'

remoteServerUrl = process.env.REMOTE_SERVER_URL || 'tls://192.168.0.122:1338'

infos = url.parse remoteServerUrl

server = net.createServer (conn) ->
  console.log "inconing TCP"

  options =
    rejectUnauthorized: false

  cleartextStream = require(infos.protocol.replace(":", "")).connect infos.port, infos.hostname, options, () ->

  cleartextStream.setEncoding 'utf8'

  cleartextStream.on 'data', (data) ->
    conn.write data

  conn.on 'data', (data) ->
    cleartextStream.write data



port = process.env.PORT || 1354
server.listen port, () ->
  console.log "server listening on #{port}"