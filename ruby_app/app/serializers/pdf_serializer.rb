class PdfSerializer < ActiveModel::Serializer
  attributes :id, :title, :page_count, :filename, :process_time
end
