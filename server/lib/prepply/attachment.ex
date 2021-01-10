defmodule Prepply.Attachment do
  alias ExAws.S3

  def upload(filepath, filename) do
    filepath
    |> S3.Upload.stream_file()
    |> S3.upload("prepplybucket", "attachments/#{filename}")
    |> ExAws.request()
  end
end
