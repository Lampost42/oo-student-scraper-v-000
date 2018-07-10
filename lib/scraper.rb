require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    doc = Nokogiri::HTML(open(index_url))
    students_doc = doc.css(".roster-cards-container")
    student_list = students_doc.css(".student-card").map{|e| e}
    student_list.each {|student| students << {name: student.css("h4").text, location: student.css("p").text, profile_url: student.css("a").attr("href").value}}
    students
  end

  def self.scrape_profile_page(profile_url)
    student = Hash.new
    doc = Nokogiri::HTML(open(profile_url))
    social_container = doc.css(".social-icon-container")
    link_list = social_container.css('a').attr('href').value.map{|e| e}
    link_list.each do |link|
      student[:twitter] = link if link.include?("twitter")
      student[:linkedin] = link if link.include?("linkedin")
      student[:github] = link if link.include?("github")
      student[:blog] = link if link.include?("learn")
    end
    
  end
end

