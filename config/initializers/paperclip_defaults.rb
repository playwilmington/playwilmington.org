# frozen_string_literal: true
Paperclip::Attachment.default_options.merge!(
  storage: :s3,
  url: "/:attachment/:id/:style/:filename",
  path: "/:class/:attachment/:id_partition/:style/:filename",
  s3_host_alias: ENV["HOST_ALIAS"],
  s3_credentials: {
    bucket: ENV["S3_BUCKET_NAME"],
    access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    s3_region: ENV["AWS_REGION"]
  }
)
