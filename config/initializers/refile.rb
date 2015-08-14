require "refile/s3"

if Rails.env.production?
  aws = {
    bucket: "com-twincresttech-assets"
  }

  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
