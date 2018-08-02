require 'watir' # Crawler
require 'watir-webdriver'
require_relative 'credentials'

browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto 'https://www.supremenewyork.com/shop/all/hats'
browser.link(:text =>"Lime").wait_until_present.click
browser.button(:text => "add to cart").wait_until_present.click
browser.link(:class => "button checkout").wait_until_present.click

puts "ENTERING NAME"
browser.text_field(:id, "order_billing_name").set("Jaquan Cooks")
puts "ENTERING EMAIL"
browser.text_field(:id, "order_email").set("Jaquan@GMAIL.COM")
puts "ENTERING PHONE"
browser.text_field(:id, "order_tel").set("4085865768")
puts "ENTERING STREET"
browser.text_field(:id, "bo").set("9870 Jaquan Dr")
puts "ENTERING ZIP"
browser.text_field(:id, "order_billing_zip").set("14365")
puts "ENTERING CITY"
browser.text_field(:id, "order_billing_city").set("Los Angeles")
puts "ENTERING STATE"
browser.select_list(:id, "order_billing_state").select_value("CA")
puts "ENTERING CARD INFO.."
browser.text_field(:placeholder => "number").set "4111111111111111"
puts "ENTERING CVV"
browser.text_field(:placeholder => "CVV").set "333"
puts "CHECKING CHECKBOX"
if !browser.checkbox(id: 'order_terms').set? then
   puts "not set"
   browser.element(class: 'icheckbox_minimal',:index => 1).click
end
puts "we have agreed to terms #{browser.checkbox(id: 'order_terms').set?}"
browser.button(:text => "process payment").wait_until_present.click
puts "We are processing the payment :)"
sleep 40
