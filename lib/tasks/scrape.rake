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



    c = ProductCollector.new("s-0e999376-0caa-480d-9bac-a0d4ab2f86b3","07100a600caa3aab8cb6a3886be041d100d421cfb7f09dbb17cd656de77f3db2")
    c.save_products(c.get_products(54775))

  end

end
