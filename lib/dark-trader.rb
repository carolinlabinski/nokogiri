require 'nokogiri'
require 'open-uri'

def creation_cryptoarray (page)
crypto_name_array = []
crypto_name_array2 = []
crypto_name_array = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
crypto_name_array.each do |crypto_link|
    crypto_name_array2 << crypto_link.text 
    end
return crypto_name_array2
end

def creation_pricearray (page)
price_array = []
price_array2 = []
price_array = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
    price_array.each do |price_link|
         price_array2 << price_link.text.delete("$").to_f
         end
return price_array2
end

def creation_hash(crypto_name_array2,price_array2)
result = {}
  crypto_name_array2.each_with_index do |value,index|
      result[value] = price_array2[index]
  end
  return result
end

def creation_minihashes(result)
a = Array.new
  result.each do |name,rate|
   new_hash = Hash.new
   new_hash[name] = rate
   a << new_hash
  end
  a
end


def perform
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
# creation_cryptoarray 
# creation_pricearray
# creation_hash 
crypto_name_array2 = creation_cryptoarray(page)
price_array2 = creation_pricearray(page)
result = creation_hash(crypto_name_array2,price_array2)
creation_minihashes(result)
end 

p perform


# def creation-tableau1(page)
# ...
# end

# def creation-tableau2(page)
#     ...
# end
 
# def creation_hash(creation_tab1, creation_tab2)
#     ...
# end

# def perform
#   page = ...
#   hash = creation_hash(creation_tab1(page), creation_tab2(page))
#   pp hash

# end




