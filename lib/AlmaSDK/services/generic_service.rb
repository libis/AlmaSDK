require 'faraday'
require 'nokogiri'
require 'nori'

class GenericService
  attr_reader :api_key, :base_url, :xml, :hash, :raw, :connection
  class << self
    attr_accessor :service
  end

  def initialize(user = 'API01', institution = '32KUL_KUL', password = 'Nc7gmYGx')
#    @api_key  = 'l7xx95f21c81868848df96d7b780ae61a2df'
    #@base_url = 'https://api-eu.hosted.exlibrisgroup.com'
    @base_url = 'http://eu.alma.exlibrisgroup.com'



    @connection = Faraday.new( url: "#{@base_url}") do |f|
     # f.headers['Authorization'] = "apikey #{@api_key}"
      f.use Faraday::Response::Logger
      f.adapter :net_http
    end
    @connection.basic_auth("AlmaSDK-#{user}-institutionCode-#{institution}", password)

  end

  def find(id, options = {})
    service = self.class.service.downcase
    url = "/almaws/v1/#{service}s/#{id}"
    url += "?#{options.to_a.map {|a| "#{a[0]}=#{a[1]}"}.join('&')}" unless options.empty?

    response = @connection.get url

    if response.status == 200
      @raw = response.body
      self.process
      self
    else
      nil
    end
  end

  def as_xml
    @xml ||= Nokogiri::XML(@raw)
  end

  def as_hash
    @hash ||= Nori.new(:strip_namespaces => true,:advanced_typecasting => false).parse(@raw)
  end

  def method_missing(m, *arg, &block)
    find_value_by_key(m.to_s)
  end

  def find_value_by_key(key, h = self.as_hash)
    return h[key] if h.has_key?(key)

    h.each do |k,v|
      if v.is_a?(Hash)
        result =  find_value_by_key(key, v)
        return result unless result.nil?
      elsif v.is_a?(Array)
        v.each do |n_h|
          result = find_value_by_key(key, n_h) if n_h.is_a?(Hash)
          return result unless result.nil?
        end
      end
    end

    nil
  end

end


=begin

$LOAD_PATH << './lib'
require 'lib/AlmaSDK'
r = RecordService.new
b=r.find('9928976210101471', expand: 'p_avail,e_avail')

puts b.record.to_xml unless b.record.nil?


=end