class UsageFileParser
  def initialize(client, usage_file)
    @client = client
    @usage_file = usage_file
  end

  def parse
    case @client.usage_file_format
    when :xml
      parse_xml
    when :csv
      parse_csv
    end
    
    @client.last_parse = Time.now
    @client.save!
  end

  private

  def parse_xml
    #parse xml
  end

  def parse_csv
    # parse csv
  end
end

###  OCP  ###

class UsageFileParser
  def initialize(client, parser)
    @client = client
    @parser = parser
  end

  def parse(usage_file)
    @parser.parse(usage_file)
    @client.last_parse = Time.now
    @client.save!
  end
end

class XmlParser
  def parse(usage_file)
    # parse xml
  end
end

class CsvParse
  def parse(usage_file)
    # parse csv
  end 
end