class Address
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :line1, :line2, :line3, :city, :state_province, :postal_code, :country, :address_note, :address_types
end