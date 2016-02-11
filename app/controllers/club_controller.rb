class ClubController < ApplicationController
  def index
	require 'net/http'
        source = 'http://holmesplace.pt/pt/api/asDFHASsdjk578bysyxc/dsp_clubinformations/get/json?'
        if params[:search]
        unless params[:search].empty?
            source = source + "name=" + params[:search]
        end
        end
        resp = Net::HTTP.get_response(URI.parse(source))
        data = resp.body
        result = JSON.parse(data)
        @club = []
        @club =  result.map{|x| x["ddAddress"]}
        p "..........."
        if @club.empty?
            flash[:notice] = "No results were found for your search"
        end
        p ".........."
        
  end
end