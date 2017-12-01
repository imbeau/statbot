namespace :scrape do
  desc "Scrape channel data"
  task channels: :environment do

    @organization = Organization.first
    @connection = Client.new(@organization)

  	c = ChannelCollector.new(@organization, @connection)
    c.save_channels(c.get_channels)


  end

  desc "Scrape product data from a given channel"
  task products_channels: :environment do


    @organization = Organization.first
    @connection = Client.new(@organization)
    
    c = ProductCollector.new(@connection)
    puts "#{c.get_total_products}"
    c.save_products(c.get_products_from_channel(54775))

  end

  desc "Scrape product data from an org"
  task products: :environment do

    @organization = Organization.first
    @connection = Client.new(@organization)

    c = ProductCollector.new(@connection)
    c.get_products

  end

end
