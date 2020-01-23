require 'nokogiri'
require 'open-uri'


def get_townhall_urls(page2)
    links = Array.new
    urls = []
    urls = page2.xpath('//a[@class="lientxt"]')
    urls.each do |link|
      links << link[:href].chars.drop(1).join.sub(/\A(?!ga:)/, "https://www.annuaire-des-mairies.com")
      return links
   end
end


def city_names(page3)
    citiy_name_array = []
    city_names_array2 = []
    city_name_array = page3.xpath('//a[@class="lientxt"]')
    city_name_array.each do |city_name|
    city_names_array2 << city_name.text
    return city_names_array2  #puts
    end
end

def townhall_emails
    townhall_email = []
    get_townhall_urls.each do |link|
     page = Nokogiri::HTML(open(link))
    adresses_mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    end
    adresses_mail.each do |links|
    townhall_email << links 
    puts townhall_email
    end
end

 
def perform
page2 = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
page3 = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
get_townhall_urls(page2)
city_names_array2 = city_names(page3) 
end

perform 