#! /usr/bin/env ruby
require 'rubygems'
require 'faraday'
require 'json'
#post payload as JSON instead of "www-form-urlencoded" encoding:
def init(username, password)
   conn = Faraday.new(:url => 'http://hokadiri.zendesk.com') do |builder|
    builder.request  :url_encoded
    builder.response :logger
    builder.adapter  :net_http
  end
  conn.basic_auth username,password
  return conn
end

def createUserX(username, password, conn)
  response =  conn.post do |req|
    req.url '/users.xml'
    req.headers['Content-Type'] = 'application/json'
    user = {}
    groups = {}
    groups = [2,3]
    user['groups'] = groups
    user['current-tags'] = 'tag_a tag_b tag_c'
    user['restriction-id'] = 1
    user['roles'] = 4
    user['name'] = 'Al Johnson'
    user['email'] = 'aljohnson@hokadiri.com'
    someUser = {}
    someUser['user'] = user

    req.body = JSON.generate(someUser)
  end  
end
  conn = init('hokadiri@yahoo.com', 'Hus++12kad')
  responseUser = createUserX('hokadiri@yahoo.com', 'Hus12++kad', conn)

  if responseUser.status == 201
    @userid = Integer(responseUser.location.slice(/\d+/))
    responseTicket = createTicket({'subject' => 'Hello', 'description' => 'My message',
                 'status-id' => 0}, conn)
    if responseTicket.status == 201
      @ticketid = Integer(responseTicket.location.slice(/\d+/))
      markAsSolved(conn)
    else
      exit
    end
  else
    exit
  end

  def createTicket(ticket, conn)
    ticket['requester-id'] = @userid

    response = conn.post do |req|
      req.url '/tickets.json'
      req.headers['Content-Type'] = 'application/json'

      someTicket = {}
      someTicket['ticket'] = ticket

      req.body = JSON.generate(someTicket)
    end
  end
  
  def markAsSolved(conn)
    response = conn.put do |req|
      req.url "/tickets/#{@ticketid}.json" 
      req.headers['Content-Type'] = 'application/json'
      someTicket = {}
      updatedTicket = {}
      updatedTicket['status-id'] = 3
      someTicket['ticket'] = updatedTicket
 
      req.body = JSON.generate(someTicket)
    end
  end
