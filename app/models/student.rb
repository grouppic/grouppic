class Student < ActiveRecord::Base
  attr_accessible :gpa, :grade, :id, :name
  has_and_belongs_to_many :groups

  def self.stu_list
    resp = RestClient.get(Rails.application.config.slc_base_url + "/rest/v1/students", Rails.application.config.slc_header) {|resp, req, res| JSON.parse(resp)}
    resp.map {|s| s["name"]["firstName"] + " " + s["name"]["lastSurname"] }
  end

end
