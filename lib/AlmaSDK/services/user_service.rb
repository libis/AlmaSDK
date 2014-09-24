require_relative 'generic_service'
require 'lib/AlmaSDK/models/user'

class UserService < GenericService
  self.service = 'user'
  attr_reader :data

  def process
    @data = User.new(self.as_hash['user'])
    @data.id = find_value_by_key('primary_id')
  end

end