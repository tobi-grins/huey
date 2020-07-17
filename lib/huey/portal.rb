# encoding: utf-8

module Huey
  module Portal
    def self.hue_ip
      return @hue_ip if @hue_ip

      response = HTTParty.get('https://discovery.meethue.com')

      raise Huey::Errors::CouldNotFindHue unless response.success? && response.respond_to?(:first)

      @hue_ip = response.first['internalipaddress']
    end
  end
end
