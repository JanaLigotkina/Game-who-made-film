#!/usr/bin/env ruby

require "pastel"

module ColorfulOutput
  def pastel
    @pastel ||= Pastel.new
  end
end
