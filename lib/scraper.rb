require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    doc = Nokogiri::HTML(open(index_url))
<<<<<<< HEAD
    students_doc = doc.css(".roster-cards-container")
    student_list = students_doc.css(".student-card").map{|e| e}
    student_list.each {|student| students << {:name => student.css("h4").text, :location => student.css("p").text, :profile_url => student.css("a").attr("href").value}}
=======
    students = doc.css.map(|e| e == "div")
>>>>>>> 867d948ed5c58e19f49ffdd45675e84fbfdd100f
    students
  end

  def self.scrape_profile_page(profile_url)
    
  end
end
<<<<<<< HEAD
=======

students = Scraper.scrape_index_page("http://165.227.60.187:38699/fixtures/student-site/index.html")
students.length
binding.pry
>>>>>>> 867d948ed5c58e19f49ffdd45675e84fbfdd100f
