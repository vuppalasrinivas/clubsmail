class ClubController < ApplicationController
  def index
	require 'net/http'
        source = 'http://holmesplace.pt/pt/api/asDFHASsdjk578bysyxc/dsp_clubinformations/get/json/'
        resp = Net::HTTP.get_response(URI.parse(source))
        data = resp.body
        result = JSON.parse(data)
        @club = []
        @club =  result.map{|x| x["ddAddress"]}
        p "..........."
        p @club
        p ".........."
  end
end
