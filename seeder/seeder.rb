config_path = File.expand_path('dh_easy.yaml', Dir.pwd)
config = YAML.load(File.open(config_path))['qa']
config['scrapers'].each do |scraper_name, collections|
  if collections
    pages << {
      url: "https://fetchtest.datahen.com/?scraper=#{scraper_name}",
      method: "GET",
      page_type: "qa",
      vars: {
        scraper_name: scraper_name,
        collections: collections
      }
    }
  end
end