LOG_BLOBS = ENV['LOG_BLOBS']

blobs = []
File.open(LOG_BLOBS, 'r') do |f|
    f.each_line do |oid|
        oid.chomp!
        blob = Storage::Blob.find_by(:oid => "#{oid}")
        view = Stafftools::StorageBlobView.new(:blob => blob)
        refs = []
        view.each_reference_link do |link|
            refs.push(ActionView::Base.full_sanitizer.sanitize(link))
        end
        blobs.push({"oid" => oid, "size" => blob.size, "refs" => refs})
    end
end

puts YAML.dump(blobs)

