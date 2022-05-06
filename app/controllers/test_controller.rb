require 'socket'

class TestController < ApplicationController
  def index
    Addrinfo.getaddrinfo('recital.software', 443, nil, :STREAM)
    render text: '', layout: false
  end
end
