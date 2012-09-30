class Student < ActiveRecord::Base
  attr_accessible :gpa, :grade, :id, :name
  has_and_belongs_to_many :groups

  def self.stu_list
    resp = RestClient.get(Rails.application.config.slc_base_url + "/rest/v1/students", Rails.application.config.slc_header) {|resp, req, res| JSON.parse(resp)}
    resp.map {|s| s["name"]["firstName"] + " " + s["name"]["lastSurname"] }
  end

  def self.fixedlist
    [ "Jiani Wu ",
      "Jenny Xie",
      "Brett Hebert",
      "Robert Snyder",
      "Alvaro Achon",
      "Yury V Kuzmichev",
      "Kathleen Ismer",
      "Jagmit Rekhi",
      "meghan OTool",
      "Guosong Shao",
      "Oriana korol",
      "Rafael Chow",
      "Rohan Ratnapal",
      "Ryan Pinette",
      "Shalin Patel",
      "Shannon O'Brien",
      "Soojin S Sung",
      "Vanessa Fong",
      "Tim Spears",
      "Xiaoan yan",
      "Yudy Halim Tan"
      ]
  end

end
