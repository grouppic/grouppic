class Student < ActiveRecord::Base
  attr_accessible :gpa, :grade, :id, :name
  has_and_belongs_to_many :groups

  def self.slc_list(token)
    header = Rails.application.config.slc_header.merge ({"Authorization" => "Bearer #{token}"})
    resp = RestClient.get(Rails.application.config.slc_base_url + "/rest/v1/students", header) {|resp, req, res| JSON.parse(resp)}
    #logger.debug "from Model debug 1: #{resp.inspect}"
    resp.map! {|s| s["name"]["firstName"] + " " + s["name"]["lastSurname"] }
    logger.debug "from Model debug 2: #{resp.inspect}"
    resp
  end
end
