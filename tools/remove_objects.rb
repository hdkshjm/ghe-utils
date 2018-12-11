File.open(ENV['OID_FILE'], 'r') do |f|
    f.each_line do |oid|
        oid.chomp!
        blob = Media::Blob.find_by(:oid => oid)
        blob.archive
        purge = Storage::Purge.find_by(:storage_blob_id => blob.storage_blob_id)
        purge.purge_at = Time.now
        purge.save
    end
end

GitHub::Jobs::DeletePurgedStorageBlobs.perform
