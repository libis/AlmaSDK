require_relative 'generic_service'

class RecordService < GenericService
  self.service = 'bib'
  attr_accessor :id, :created_at, :created_by, :record

  def process
    @id = self.as_hash['bib']['mms_id']
    @created_by = self.as_hash['bib']['created_by']
    @created_at = self.as_hash['bib']['created_at']
    @record = self.as_xml.xpath('/bib/record')
  end

  def holdings

  end

  def leader

  end
end