namespace :scrape do
  desc "Scrape channel data"
  task channels: :environment do

    @organization = Organization.first
    @connection = Client.new(@organization)

  	c = ChannelCollector.new(@organization, @connection)
    c.save_channels(c.get_channels)


  end

  desc "Scrape product data"
  task products: :environment do


    @organization = Organization.first
    @connection = Client.new(@organization)
    
    c = ProductCollector.new(@connection)
    puts "#{c.get_total_products}"
    c.save_products(c.get_products(54775))

  end

end
