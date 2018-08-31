require 'open-uri'
require 'nokogiri'
require 'watir'
require  'capybara'
 require  'selenium-webdriver'
 require 'webdrivers'
 # require  'chromedriver-helper'
url="https://www.hostelworld.com/search?search_keywords=London%2C+England&country=England&city=London&date_from=2018-10-03&date_to=2018-10-04&number_of_guests=1&disableunderrated=true&ShowAll=1"


browser = Watir::Browser.new
browser.goto url

sleep 10
doc = Nokogiri::HTML.parse(browser.html) ; nil
  results = []
doc.search(".fabresult").each do |element|
  results << {
    title: element.search("h2").map{|i| i.children.children.text.strip}.first,
    image_url: element.search(".active").children.first.attributes["data-lazy"].value.strip,
    link_url_or_address: element.search("h2").children[1].attributes["href"].value
  }
end

browser.close if browser

results.each do |result|
  meta_browser = Watir::Browser.new
  meta_browser.goto result[:link_url_or_address]
  sleep 5
  5.times do
    meta_browser.send_keys :space
  end
  sleep 5
  50.times do
    meta_browser.send_keys :space
  end
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  meta_browser.send_keys :space
  sleep 5
  meta_doc = Nokogiri::HTML.parse(meta_browser.html) ; nil
  address = meta_doc.search('.address-street').text ; nil
  result[:link_url_or_address] = address
  meta_browser.close if meta_browser
end




[{:title=>"Generator Hostel London", :image_url=>"//a.hwstatic.com/propertyimages/5/510/371_30.jpg", :link_url_or_address=>"Compton Place, Off 37 Tavistock Place, WC1"},
 {:title=>"Wombats City Hostel London", :image_url=>"//a.hwstatic.com/propertyimages/8/88047/40_30.jpg", :link_url_or_address=>"7 Dock Street"},
 {:title=>"Rest Up London", :image_url=>"//a.hwstatic.com/propertyimages/6/62036/138_30.jpg", :link_url_or_address=>"172 New Kent Road"},
 {:title=>"Clink78", :image_url=>"//a.hwstatic.com/propertyimages/2/21954/129_30.jpg", :link_url_or_address=>""},
 {:title=>"Hostel One Camden", :image_url=>"//a.hwstatic.com/propertyimages/2/283734/35_30.jpg", :link_url_or_address=>"2 Southampton Rd, Belsize Park"},
 {:title=>"SoHostel", :image_url=>"//a.hwstatic.com/propertyimages/9/92473/58_30.jpg", :link_url_or_address=>"91 Dean Street, Soho, Westminster"},
 {:title=>"Palmers Lodge - Swiss Cottage", :image_url=>"//a.hwstatic.com/propertyimages/1/14348/80_30.jpg", :link_url_or_address=>""},
 {:title=>"Palmers Lodge - Hillspring at Willesden Green", :image_url=>"//a.hwstatic.com/propertyimages/3/36345/52_30.jpg", :link_url_or_address=>""},
 {:title=>"London Waterloo Hostel", :image_url=>"//a.hwstatic.com/propertyimages/3/39493/26_30.jpg", :link_url_or_address=>"73 Lambeth Walk, London"},
 {:title=>"Clink261", :image_url=>"//a.hwstatic.com/propertyimages/5/516/114_30.jpg", :link_url_or_address=>"261-265 Grays Inn Road, Kings Cross"},
 {:title=>"Astor Museum Inn", :image_url=>"//a.hwstatic.com/propertyimages/5/520/5017_30.jpg", :link_url_or_address=>"27 Montague Street, Bloomsbury"},
 {:title=>"St Christopher's Village", :image_url=>"//a.hwstatic.com/propertyimages/5/502/57_30.jpg", :link_url_or_address=>"165 Borough High Street"},
 {:title=>"Astor Hyde Park", :image_url=>"//a.hwstatic.com/propertyimages/2/25678/48_30.jpg", :link_url_or_address=>"191 Queensgate, South Kensington"},
 {:title=>"Keystone House Kings Cross", :image_url=>"//a.hwstatic.com/propertyimages/4/43465/5025_30.jpg", :link_url_or_address=>"272-276 Pentonville Road Kings Cross, London"},
 {:title=>"The Dictionary Hostel, Shoreditch, London", :image_url=>"//a.hwstatic.com/propertyimages/6/61178/5032_30.jpg", :link_url_or_address=>"10-20 Kingsland Road"},
 {:title=>"Astor Victoria", :image_url=>"//a.hwstatic.com/propertyimages/5/524/5046_30.jpg", :link_url_or_address=>"71 Belgrave Road, Victoria"},
 {:title=>"Astor Kensington", :image_url=>"//a.hwstatic.com/propertyimages/5/523/31_30.jpg", :link_url_or_address=>"45 Queensborough Terrace, Bayswater"},
 {:title=>"Saint James Backpackers", :image_url=>"//a.hwstatic.com/propertyimages/7/70909/98_30.jpg", :link_url_or_address=>"21 Longridge Road"},
 {:title=>"The Walrus Hostel", :image_url=>"//a.hwstatic.com/propertyimages/5/58378/5035_30.jpg", :link_url_or_address=>"172 Westminster, Bridge Road"},
 {:title=>"YHA London Oxford Street", :image_url=>"//a.hwstatic.com/propertyimages/6/6996/31_30.jpg", :link_url_or_address=>"14 Noel Street, Soho, W1F 8GJ"},
 {:title=>"St Christopher's Inn - London Bridge", :image_url=>"//a.hwstatic.com/propertyimages/5/503/501_30.jpg", :link_url_or_address=>"121 Borough High Street"},
 {:title=>"MEININGER London Hyde Park", :image_url=>"//a.hwstatic.com/propertyimages/1/17414/131_30.jpg", :link_url_or_address=>"at Baden Powell House, 65-67 Queen's Gate"},
 {:title=>"St Christopher's Camden", :image_url=>"//a.hwstatic.com/propertyimages/5/505/37_30.jpg", :link_url_or_address=>"48-50 Camden High Street, Camden NW1"},
 {:title=>"The Birds Hostel", :image_url=>"//a.hwstatic.com/propertyimages/2/283866/13_30.jpg", :link_url_or_address=>"692 High Road, Leytonstone"},
 {:title=>"Via Limehouse", :image_url=>"//a.hwstatic.com/propertyimages/1/100584/502_30.jpg", :link_url_or_address=>"628 - 634 Commercial Road, Limehouse"},
 {:title=>"YHA London Central", :image_url=>"//a.hwstatic.com/propertyimages/2/23598/5015_30.jpg", :link_url_or_address=>"104-108 Bolsover St"},
 {:title=>"No.8 Seven Sisters", :image_url=>"//a.hwstatic.com/propertyimages/9/91108/1_30.jpg", :link_url_or_address=>"618 Seven Sisters Rd, Seven Sisters"},
 {:title=>"No.8 Willesden Hostel London", :image_url=>"//a.hwstatic.com/propertyimages/1/18420/12_30.jpg", :link_url_or_address=>"305 High Rd, Willesden"},
 {:title=>"Via London", :image_url=>"//a.hwstatic.com/propertyimages/2/265813/23_30.jpg", :link_url_or_address=>"30 Old Road"},
 {:title=>"Gallery Hyde Park", :image_url=>"//a.hwstatic.com/propertyimages/7/73177/27_30.jpg", :link_url_or_address=>""},
 {:title=>"Phoenix Hostel", :image_url=>"//a.hwstatic.com/propertyimages/4/48221/501_30.jpg", :link_url_or_address=>"6 Daventry Street"},
 {:title=>"St Christopher's Hammersmith", :image_url=>"//a.hwstatic.com/propertyimages/2/20976/506_30.jpg", :link_url_or_address=>"28, Hammersmith Broadway, Hammersmith"},
 {:title=>"Central Hostel", :image_url=>"//a.hwstatic.com/propertyimages/5/5159/5025_30.jpg", :link_url_or_address=>"26 Princes Square"},
 {:title=>"No.8 at The White Horse", :image_url=>"//a.hwstatic.com/propertyimages/2/268091/17_30.jpg", :link_url_or_address=>""},
 {:title=>"Barmy Badger Backpackers", :image_url=>"//a.hwstatic.com/propertyimages/6/64746/9_30.jpg", :link_url_or_address=>"17 Longridge Road, Earls Court"},
 {:title=>"Abercorn House", :image_url=>"//a.hwstatic.com/propertyimages/3/34216/1_30.jpg", :link_url_or_address=>"28 Bute Gardens, Hammersmith"},
 {:title=>"YHA London St Pancras", :image_url=>"//a.hwstatic.com/propertyimages/7/7010/24_30.jpg", :link_url_or_address=>"79-81 Euston Road"},
 {:title=>"St Christopher's Greenwich", :image_url=>"//a.hwstatic.com/propertyimages/5/501/48_30.jpg", :link_url_or_address=>"189 Greenwich High Road, Greenwich"},
 {:title=>"Destinations at The Rose & Crown", :image_url=>"//a.hwstatic.com/propertyimages/6/62973/10_30.jpg", :link_url_or_address=>"65 Union Street, Borough"},
 {:title=>"Smart Russell Square Hostel", :image_url=>"//a.hwstatic.com/propertyimages/2/29412/5022_30.jpg", :link_url_or_address=>"71 Guilford Street"},
 {:title=>"St Christopher's Inn - Liverpool Street", :image_url=>"//a.hwstatic.com/propertyimages/2/271698/39_30.jpg", :link_url_or_address=>""},
 {:title=>"Pickwick Hall", :image_url=>"//a.hwstatic.com/propertyimages/7/7502/1_30.jpg", :link_url_or_address=>"7 Bedford Place, Bloomsbury"},
 {:title=>"Dover Castle Hostel and Bar", :image_url=>"//a.hwstatic.com/propertyimages/5/530/3_30.jpg", :link_url_or_address=>"6a Great Dover Street"},
 {:title=>"The Hurdwick", :image_url=>"//a.hwstatic.com/propertyimages/2/285882/35_30.jpg", :link_url_or_address=>"2 Hurdwick Place"},
 {:title=>"St Christopher's Shepherds Bush", :image_url=>"//a.hwstatic.com/propertyimages/5/506/41_30.jpg", :link_url_or_address=>"Belushis Bar, 13-15 Shepherds Bush Green."},
 {:title=>"The Horse and Stables", :image_url=>"//a.hwstatic.com/propertyimages/8/81959/501_30.jpg", :link_url_or_address=>"124 Westminster Bridge Road, London"},
 {:title=>"St Christopher's Oasis-Female Only", :image_url=>"//a.hwstatic.com/propertyimages/5/504/23_30.jpg", :link_url_or_address=>"163 Borough High Street, SE1 1HR, Southwark"},
 {:title=>"YHA London St Pauls", :image_url=>"//a.hwstatic.com/propertyimages/6/6977/12_30.jpg", :link_url_or_address=>"36 Carter Lane, EC4V 5AB"},
 {:title=>"Home London", :image_url=>"//a.hwstatic.com/propertyimages/8/8364/19_30.jpg", :link_url_or_address=>"54-58 Caledonian Road, Kings Cross"},
 {:title=>"Queen Elizabeth Chelsea", :image_url=>"//a.hwstatic.com/propertyimages/5/50443/5023_30.jpg", :link_url_or_address=>"58 Bagleys Lane"},
 {:title=>"Pride of Paddington", :image_url=>"//a.hwstatic.com/propertyimages/4/48393/503_30.jpg", :link_url_or_address=>"1-3 Craven Road, Paddington"},
 {:title=>"Hostel One Notting Hill", :image_url=>"//a.hwstatic.com/propertyimages/2/291433/34_30.jpg", :link_url_or_address=>"63 Prince's Square"},
 {:title=>"Venture Hostel", :image_url=>"//a.hwstatic.com/propertyimages/1/14746/77_30.jpg", :link_url_or_address=>"86 Tanner's Hill, Deptford"},
 {:title=>"Smart Hyde Park View Hostel", :image_url=>"//a.hwstatic.com/propertyimages/8/8069/1_30.jpg", :link_url_or_address=>"16 Leinster Terrace W2 3EU"},
 {:title=>"Green Rooms", :image_url=>"//a.hwstatic.com/propertyimages/2/271479/1_30.jpg", :link_url_or_address=>"13-27 Station Road, Wood Green"},
 {:title=>"Atlas Hostels", :image_url=>"//a.hwstatic.com/propertyimages/7/79008/23_30.jpg", :link_url_or_address=>"16 Talbot Square, Paddington"},
 {:title=>"Smart Hyde Park Inn Hostel", :image_url=>"//a.hwstatic.com/propertyimages/5/517/502_30.jpg", :link_url_or_address=>"48 - 50 Inverness Terrace, Bayswater"},
 {:title=>"Prime Backpackers Angel", :image_url=>"//a.hwstatic.com/propertyimages/9/93902/7_30.jpg", :link_url_or_address=>"Baggies Angel, 333 City Road"},
 {:title=>"Strand Continental", :image_url=>"//a.hwstatic.com/propertyimages/5/51118/504_30.png", :link_url_or_address=>"143 Strand, London"},
 {:title=>"PubLove @ The Crown, Battersea", :image_url=>"//a.hwstatic.com/propertyimages/6/60336/78_30.jpg", :link_url_or_address=>"102 Lavender Hill,, Battersea"},
 {:title=>"Aquarius Hotel", :image_url=>"//a.hwstatic.com/propertyimages/2/278554/1_30.jpg", :link_url_or_address=>"20-22 Hogarth Road"},
 {:title=>"Smart Camden Inn Hostel", :image_url=>"//a.hwstatic.com/propertyimages/5/596/2_30.jpg", :link_url_or_address=>"55/57 Bayham Street, Camden"},
 {:title=>"The Backpackshack", :image_url=>"//a.hwstatic.com/propertyimages/6/63112/5017_30.jpg", :link_url_or_address=>"1 Mill Hill Road, The Talbot Pub, W3 8JB"},
 {:title=>"New Cross Inn Hostel", :image_url=>"//a.hwstatic.com/propertyimages/1/15204/11_30.jpg", :link_url_or_address=>"323 New Cross Road"},
 {:title=>"PubLove @ The Green Man, Paddington", :image_url=>"//a.hwstatic.com/propertyimages/2/21953/21_30.jpg", :link_url_or_address=>"308 Edgware Road"},
 {:title=>"YHA London Thameside", :image_url=>"//a.hwstatic.com/propertyimages/7/7000/11_30.jpg", :link_url_or_address=>"20 Salter Road, Rotherhithe,"},
 {:title=>"PubLove @ The White Ferry, Victoria", :image_url=>"//a.hwstatic.com/propertyimages/3/39761/2_30.jpg", :link_url_or_address=>"1a Sutherland Street, Victoria"},
 {:title=>"PubLove @ The Exmouth Arms, Euston", :image_url=>"//a.hwstatic.com/propertyimages/9/93796/3_30.jpg", :link_url_or_address=>"1 Starcross Street"},
 {:title=>"Chelsea House Hotel", :image_url=>"//a.hwstatic.com/propertyimages/3/35496/1_30.jpg", :link_url_or_address=>"No.96 Redcliffe Gardens, Earls Court"},
 {:title=>"The Lodge at Crystal Palace", :image_url=>"//a.hwstatic.com/propertyimages/4/46276/23_30.jpg", :link_url_or_address=>"Crystal Palace National Sports Centre, Upper Norwood"},
 {:title=>"PubLove @ The Steam Engine, Waterloo", :image_url=>"//a.hwstatic.com/propertyimages/2/29389/2_30.jpg", :link_url_or_address=>"41-42 Cosser St"},
 {:title=>"Antigallican Hotel", :image_url=>"//a.hwstatic.com/propertyimages/1/18780/10_30.jpg", :link_url_or_address=>"428 Woolwich Road"},
 {:title=>"Barkston Rooms", :image_url=>"//a.hwstatic.com/propertyimages/8/81305/31_30.jpg", :link_url_or_address=>""},
 {:title=>"The Finnish Church in London", :image_url=>"//a.hwstatic.com/propertyimages/8/80791/4_30.jpg", :link_url_or_address=>"33 Albion Street, Rotherhithe"},
 {:title=>"Blue Skies Hostel", :image_url=>"//a.hwstatic.com/propertyimages/4/48530/5_30.jpg", :link_url_or_address=>"7 Station Rise, London"},
 {:title=>"Hootananny Hostel", :image_url=>"//a.hwstatic.com/propertyimages/2/24068/48_30.jpg", :link_url_or_address=>"95 Effra Road, Brixton"},
 {:title=>"Kensal Green Backpackers", :image_url=>"//a.hwstatic.com/propertyimages/4/4483/4_30.jpg", :link_url_or_address=>"639 Harrow Road"},
 {:title=>"Chester Hotel Victoria", :image_url=>"//a.hwstatic.com/propertyimages/2/24750/1_30.jpg", :link_url_or_address=>"27-29 Longmoore Street, Victoria"},
 {:title=>"YHA London Earls Court", :image_url=>"//a.hwstatic.com/propertyimages/6/6981/2_30.jpg", :link_url_or_address=>"38 Bolton Gardens, SW5 0AQ"},
 {:title=>"Jaeger Acton Hostel", :image_url=>"//a.hwstatic.com/propertyimages/1/15584/4_30.jpg", :link_url_or_address=>"50, Acton High street, Acton"},
 {:title=>"Heathrow Hostel", :image_url=>"//a.hwstatic.com/propertyimages/6/64089/1_30.jpg", :link_url_or_address=>"198 Kingsley Road, Heathrow"},
 {:title=>"Le Junction Hostel - Pub & Garden", :image_url=>"//a.hwstatic.com/propertyimages/9/90013/5_30.jpg", :link_url_or_address=>"47 Station road"},
 {:title=>"Hotel Bluebells", :image_url=>"//a.hwstatic.com/propertyimages/9/96186/1_30.jpg", :link_url_or_address=>"14 Pembridge Square, Notting Hill Gate"},
 {:title=>"PubLove @ The Great Eastern, Greenwich", :image_url=>"//a.hwstatic.com/propertyimages/4/48268/3_30.jpg", :link_url_or_address=>"1 Glenaffric Avenue"},
 {:title=>"The Ambassador Heathrow Hotel", :image_url=>"//a.hwstatic.com/propertyimages/2/21896/2_30.jpg", :link_url_or_address=>"10 Hanworth Road, Feltham,Middlesex, Heathrow"},
 {:title=>"Acacia Hostel", :image_url=>"//a.hwstatic.com/propertyimages/6/6167/15_30.jpg", :link_url_or_address=>""},
 {:title=>"Enrico Hotel", :image_url=>"//a.hwstatic.com/propertyimages/5/5585/1_30.jpg", :link_url_or_address=>"77-79 Warwick Way, Victoria"},
 {:title=>"Northfields Hostel", :image_url=>"//a.hwstatic.com/propertyimages/3/34115/1_30.jpg", :link_url_or_address=>"264 Northfield Avenue, London"},
 {:title=>"Heathrow Lodge", :image_url=>"//a.hwstatic.com/propertyimages/2/24900/3_30.jpg", :link_url_or_address=>""},
 {:title=>"Central Park Hotel", :image_url=>"//a.hwstatic.com/propertyimages/2/284176/2_30.jpg", :link_url_or_address=>"3-15 Wilberforce Road, Finsbury Park"},
 {:title=>"Marble Arch Inn", :image_url=>"//a.hwstatic.com/propertyimages/1/13337/2_30.jpg", :link_url_or_address=>"49-50 Upper Berkeley Street, Marble Arch"},
 {:title=>"Barry House", :image_url=>"//a.hwstatic.com/propertyimages/2/287321/1_30.jpg", :link_url_or_address=>""},
 {:title=>"Kip Hotel", :image_url=>"//a.hwstatic.com/propertyimages/2/266789/1_30.jpg", :link_url_or_address=>"2 Aspland Grove"},
 {:title=>"Hyde Park Court Hotel", :image_url=>"//a.hwstatic.com/propertyimages/5/5107/4_30.jpg", :link_url_or_address=>"48 Norfolk Square"},
 {:title=>"Tony's House Hotel", :image_url=>"//a.hwstatic.com/propertyimages/8/8503/2_30.jpg", :link_url_or_address=>"30 Norfolk Square, Hyde Park"},
 {:title=>"Arinza Hotel", :image_url=>"//a.hwstatic.com/propertyimages/2/266580/1_30.jpg", :link_url_or_address=>"50 Mansfield Rd, Ilford, Essex"},
 {:title=>"Balham Lodge", :image_url=>"//a.hwstatic.com/propertyimages/1/19933/5_30.jpg", :link_url_or_address=>"204 Bedford Hill, London"},
 {:title=>"Hyde Park Superior Apartments", :image_url=>"//a.hwstatic.com/propertyimages/2/271903/1_30.jpg", :link_url_or_address=>"34 & 55 Inverness Terrace, Bayswater"},
 {:title=>"London Town Hotel", :image_url=>"//a.hwstatic.com/propertyimages/3/32376/2_30.jpg", :link_url_or_address=>"15 Penywern Road, Earls Court"},
 {:title=>"Elmwood Hotel", :image_url=>"//a.hwstatic.com/propertyimages/3/34338/8_30.jpg", :link_url_or_address=>"19 & 20 Argyle square, London"},
 {:title=>"Sara Hotel", :image_url=>"//a.hwstatic.com/propertyimages/6/6345/38_30.jpg", :link_url_or_address=>""},
 {:title=>"Fairway Hotel", :image_url=>"//a.hwstatic.com/propertyimages/8/81121/9_30.jpg", :link_url_or_address=>"15 Argyle Street"},
 {:title=>"The Crystal Lodge Hotel", :image_url=>"//a.hwstatic.com/propertyimages/9/96148/15_30.jpg", :link_url_or_address=>"49 Brigstock Road"},
 {:title=>"City Hotel Carlton", :image_url=>"//a.hwstatic.com/propertyimages/2/27551/4_30.jpg", :link_url_or_address=>"90 Belgrave Road, Victoria"},
 {:title=>"Kensington West", :image_url=>"//a.hwstatic.com/propertyimages/2/21368/2_30.jpg", :link_url_or_address=>"25 Matheson Road, Kensington"},
 {:title=>"The Dover", :image_url=>"//a.hwstatic.com/propertyimages/2/267341/1_30.jpg", :link_url_or_address=>"44 Belgrave Road"},
 {:title=>"Best Western Boltons London Kensington", :image_url=>"//a.hwstatic.com/propertyimages/2/266666/1_30.JPG", :link_url_or_address=>"19-21 Penywern Road"},
 {:title=>"Hanover Hotel", :image_url=>"//a.hwstatic.com/propertyimages/6/6252/2_30.jpg", :link_url_or_address=>"30 St. Georges Drive, Victoria"},
 {:title=>"Surtees", :image_url=>"//a.hwstatic.com/propertyimages/1/13266/2_30.jpg", :link_url_or_address=>"94 Warwick Way"},
 {:title=>"Beaconsfield", :image_url=>"//a.hwstatic.com/propertyimages/1/11708/501_30.jpg", :link_url_or_address=>"357 - 359 Green Lanes"},
 {:title=>"Lord Kensington Hotel", :image_url=>"//a.hwstatic.com/propertyimages/8/8781/7_30.jpg", :link_url_or_address=>"38 Trebovir Road, Earls Court"},
 {:title=>"Imperial Court Suites", :image_url=>"//a.hwstatic.com/propertyimages/2/270842/1_30.jpg", :link_url_or_address=>"81-83 Inverness Terrace, Bayswater"},
 {:title=>"Belgrave Hotel London", :image_url=>"//a.hwstatic.com/propertyimages/2/268771/1_30.jpg", :link_url_or_address=>"9-13 Clapham Road, Oval"},
 {:title=>"Revive Lodge", :image_url=>"//a.hwstatic.com/propertyimages/3/30189/1_30.jpg", :link_url_or_address=>"89 Hounslow Road, Feltham, Middlesex"},
 {:title=>"London Wembley International Hotel", :image_url=>"//a.hwstatic.com/propertyimages/2/26351/4_30.jpg", :link_url_or_address=>"Empire Way, Wembley, Middlesex"},
 {:title=>"Ridgeway Hotel", :image_url=>"//a.hwstatic.com/propertyimages/8/82826/2_30.jpg", :link_url_or_address=>"115-117, The Ridgeway, North Chingford"},
 {:title=>"Curzon House Hotel", :image_url=>"//a.hwstatic.com/propertyimages/7/7240/5_30.jpg", :link_url_or_address=>"58 Courtfield Gardens, West End"},
 {:title=>"Royal Hyde Park Hotel", :image_url=>"//a.hwstatic.com/propertyimages/3/34048/2_30.jpg", :link_url_or_address=>"106/110 Queensway, London"},
 {:title=>"Goddis Lodge", :image_url=>"//a.hwstatic.com/propertyimages/7/70632/4_30.JPG", :link_url_or_address=>"126 New Cross Road, London, SE14 5BA"},
 {:title=>"Vegas Hotel", :image_url=>"//a.hwstatic.com/propertyimages/8/8267/1_30.jpg", :link_url_or_address=>"104 Warwick way, Victoria"},
 {:title=>"Astor Court Hotel", :image_url=>"//a.hwstatic.com/propertyimages/5/58809/2_30.jpg", :link_url_or_address=>"20, Hallam Street., London. W1W 6JQ. UK"},
 {:title=>"Airways Hotel Victoria London",
  :image_url=>"//a.hwstatic.com/propertyimages/1/16289/2_30.jpg",
  :link_url_or_address=>
   "13-27 Station Road, Wood Green20-22 Hogarth RoadNo.96 Redcliffe Gardens, Earls Court27-29 Longmoore Street, Victoria14 Pembridge Square, Notting Hill Gate10 Hanworth Road, Feltham,Middlesex, Heathrow77-79 Warwick Way, Victoria556, Old Bath Road, Longford, Middlesex, Heathrow3-15 Wilberforce Road, Finsbury Park29 St. Georges Drive, Victoria"},
 {:title=>"Princes Square Hotel", :image_url=>"//a.hwstatic.com/propertyimages/3/35590/10_30.jpg", :link_url_or_address=>"23-25 Princes Square,Off Ilchester Gardens, Baywater"},
 {:title=>"London House Hotel", :image_url=>"//a.hwstatic.com/propertyimages/5/529/2_30.jpg", :link_url_or_address=>"81 Kensington Garden Square, Bayswater W2 4DJ"},
 {:title=>"London Backpackers", :image_url=>"//a.hwstatic.com/propertyimages/5/527/25_30.JPG", :link_url_or_address=>"8/10 Queens Parade, Queens Road, Hendon Central"},
 {:title=>"Safestay London Elephant & Castle", :image_url=>"//a.hwstatic.com/propertyimages/5/55551/3_30.jpg", :link_url_or_address=>""},
 {:title=>"Safestay London Kensington Holland Park", :image_url=>"//a.hwstatic.com/propertyimages/9/93920/12_30.jpg", :link_url_or_address=>""},
 {:title=>"The London Home Hostel", :image_url=>"//a.hwstatic.com/propertyimages/8/80690/6_30.jpg", :link_url_or_address=>"39 Chatsworth Road, London"},
 {:title=>"Park Villa", :image_url=>"//a.hwstatic.com/propertyimages/9/98066/5029_30.jpg", :link_url_or_address=>"51 Grove Road, Bow"},
 {:title=>"247london Hostel and Private Rooms", :image_url=>"//a.hwstatic.com/propertyimages/6/64523/1_30.jpg", :link_url_or_address=>"37 Chatworth Road, London"},
 {:title=>"Budget London Apartments", :image_url=>"//a.hwstatic.com/propertyimages/1/11493/7_30.jpg", :link_url_or_address=>"30 Chatsworth Rd., Willesden Green"},
 {:title=>"London365 Hostel", :image_url=>"//a.hwstatic.com/propertyimages/6/61114/26_30.jpg", :link_url_or_address=>""},
 {:title=>"ALL STAR PRIVATE STUDIOS", :image_url=>"//a.hwstatic.com/propertyimages/2/24709/1_30.jpg", :link_url_or_address=>"Willesden Green"},
 {:title=>"Mapesbury Hostel", :image_url=>"//a.hwstatic.com/propertyimages/1/19667/21_30.jpg", :link_url_or_address=>"39 Chatsworth Road"},
 {:title=>"Best London Hostels", :image_url=>"//a.hwstatic.com/propertyimages/7/72053/1_30.jpg", :link_url_or_address=>""},
 {:title=>"247 London Studios", :image_url=>"//a.hwstatic.com/propertyimages/8/84154/4_30.jpg", :link_url_or_address=>"47 Brondesbury Park"},
 {:title=>"Dean Court", :image_url=>"//a.hwstatic.com/propertyimages/1/101860/5035_30.jpg", :link_url_or_address=>"57 Inverness, Terrace, Bayswater"},
 {:title=>"OneRoom", :image_url=>"//a.hwstatic.com/propertyimages/2/290503/49_30.jpg", :link_url_or_address=>"12 Selsdon Road"},
 {:title=>"Euro Hotel Hammersmith", :image_url=>"//a.hwstatic.com/propertyimages/8/83156/4_30.jpg", :link_url_or_address=>"31 Shepherds Bush Road, Hammersmith"},
 {:title=>"Kings Cross Guesthouse", :image_url=>"//a.hwstatic.com/propertyimages/8/81486/2_30.jpg", :link_url_or_address=>"36 E Outram place, London"},
 {:title=>"The Old Crown Inn", :image_url=>"//a.hwstatic.com/propertyimages/2/266093/1_30.jpg", :link_url_or_address=>""},
 {:title=>"Rowan Park Lodge", :image_url=>"//a.hwstatic.com/propertyimages/6/64300/1_30.jpg", :link_url_or_address=>"18 Jack Dimmer Close"},
 {:title=>"Access Kensington Olympia", :image_url=>"//a.hwstatic.com/propertyimages/2/272716/1_30.jpg", :link_url_or_address=>"7A North End Road"},
 {:title=>"Spacious 1 Bed Apartment with River Thames Views", :image_url=>"//a.hwstatic.com/propertyimages/2/272107/28_30.jpg", :link_url_or_address=>"18 Dwyer House, 2 Townmead Road, Fulham"},
 {:title=>"Victor Hotel", :image_url=>"//a.hwstatic.com/propertyimages/7/76699/2_30.jpg", :link_url_or_address=>"51 Belgrave Road, Victoria"},
 {:title=>"Access Euston", :image_url=>"//a.hwstatic.com/propertyimages/2/274828/2_30.jpg", :link_url_or_address=>"209 North Gower Street"},
 {:title=>"Access City", :image_url=>"//a.hwstatic.com/propertyimages/2/271429/1_30.jpg", :link_url_or_address=>"Macclesfield Road"},
 {:title=>"Access Paddington", :image_url=>"//a.hwstatic.com/propertyimages/2/274823/13_30.jpg", :link_url_or_address=>"5 Praed Street"},
 {:title=>"Access Maida Vale", :image_url=>"//a.hwstatic.com/propertyimages/2/274827/4_30.jpg", :link_url_or_address=>"31 Clifton Gardens, Maida Vale"}]
