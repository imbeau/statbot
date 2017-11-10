require 'test_helper'

class ChannelTest < ActiveSupport::TestCase

	def setup
		@channel = Channel.new(name: "foo", channel_id: 123)
	end

	test 'should be valid?' do 
		assert @channel.valid?
	end

	test 'should have name?' do
		@channel.name = ""
		assert_not @channel.valid?
	end

	test 'should have channel_id?' do
		@channel.channel_id = ""
		assert_not @channel.valid?
	end

	test 'should be enabled or disabled?' do
		@channel.enabled = nil
		assert_not @channel.valid?
	end

end
