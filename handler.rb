require 'json'
require 'aws-sdk-s3'

def handler(event:, context:)
  p 'start event triggered by s3 create object.'
  s3_bucket_name = event["Records"][0].dig("s3", "bucket", "name")
  object_key = event["Records"][0].dig("s3", "object", "key")

  s3 = Aws::S3::Client.new
  uploaded_json_obj = s3.get_object(bucket: s3_bucket_name, key:object_key)
  json_str = uploaded_json_obj.body.read
  p JSON.parse(json_str)["hoge"]

  # 処理が成功したら対象のjson fileを削除する
  s3.delete_object(bucket: s3_bucket_name, key:object_key)
end
