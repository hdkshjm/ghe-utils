require 'yaml'

yaml_contents = open('logs/object_size.yml', 'r') { |f| YAML.load(f) }
File.open('logs/object_size.tsv', 'w') do |file|
  yaml_contents.each do |record|
    oid = record["oid"]
    size = record["size"]
    refs = record["refs"].join(",")

    file << "#{oid}\t#{size}\t#{refs}"
    file << "\n"
  end
end

