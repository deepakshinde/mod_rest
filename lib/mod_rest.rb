require 'mod_rest/version'
require 'json'
require 'net/http'

module ModRest
  class Client
    # New initialize object
    def initialize(attributes = {})
      @url = URI.parse attributes.fetch(:url, URL)
      @host = attributes.fetch(:host, VIRTUAL_HOST)
      @client = Net::HTTP.new(@url.host, @url.port)
    end

    # Register a new user
    # Take params username and password
    def register(username, password)
      data = "register #{username} #{@host} #{password}"
      response data
    end

    # Unregister user
    # Take params username
    def unregister(username)
      data = "unregister #{username} #{@host}"
      response data
    end

    # Change user's password
    # Take params username and new password
    def change_password(username, new_password)
      data = "change_password #{username} #{@host} #{new_password}"
      response(data)
    end

    # Check all online user
    def online_users
      data = "connected_users"
      response(data)
    end

    # Get the number of established sessions
    def connected_users_number
      data = "connected_users_number"
      response(data)
    end

    #Disconnect user’s active sessions
    def kick_user username
      data = "kick_user #{username} #{@host}"
      response(data)
    end

    # Delete offline messages older than the given days.
    def delete_old_messages day
      data = "delete_old_messages #{day}"
      response(data)
    end

    # List user’s connected resources
    def user_resources username
      data = "user_resources"
      response(data)
    end

    def status
      data = "status"
      response(data)
    end

    # List all registered users in HOST
    def register_users
      data = "registered_users #{@host}"
      response(data)
    end

    # add buddy and auto subscription
    def add_friend(username, friend_name, nicname = "")
      nic = nicname.blank? ? username : nicname
      data = "add_rosteritem #{username} #{@host} #{friend_name} #{@host } #{nic} Match both"
      response(data)
    end

    def get_friends(username)
      data = "get_roster #{username} #{@host}"
      response(data)
    end

    private
    def prepare_request request
      request['Content-Type'] = 'application/json'
      request['Accept'] = 'application/json'
      request
    end

    def response(body)
      request = prepare_request(Net::HTTP::Post.new(@url.request_uri))
      request.body = body
      msg = @client.request(request).body
      { status: true, message: msg }
    rescue Exception => e
      { status: false, message: e.message }
    end
  end
end

