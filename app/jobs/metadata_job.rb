class MetadataJob < ApplicationJob
    def perform(short_code)
      puts "Fetching metadata for #{short_code}"
      link = Link.find_by(short_code: short_code)
      puts "Link: #{link.inspect}"
      link.update Metadata.retrieve_from(link.original_url).attributes
      link.broadcast_replace_to link
  end
end
