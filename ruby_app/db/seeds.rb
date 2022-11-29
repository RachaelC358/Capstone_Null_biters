# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Pdf.destroy_all
Pdf.create!([{
  id: "0",
  title: "Design Document",
  page_count: "4",
  filename: "design.pdf",
  process_time: "0"
  },
  {
  id: "1",
  title: "Project Document",
  page_count: "2",
  filename: "projects.pdf",
  process_time: "0"
  },
  {
  id: "2",
  title: "Requirements Document",
  page_count: "4",
  filename: "requirements.pdf",
  process_time: "0"
}])
pdf = Pdf.where(id: "0").first!
pdf.pfile.attach(io: File.open('public/pdf/design.pdf'), filename: 'design.pdf', content_type: 'application/pdf')
pdf.save!
pdf = Pdf.where(id: "1").first!
pdf.pfile.attach(io: File.open('public/pdf/projects.pdf'), filename: 'projects.pdf', content_type: 'application/pdf')
pdf.save!
pdf = Pdf.where(id: "2").first!
pdf.pfile.attach(io: File.open('public/pdf/requirements.pdf'), filename: 'requirements.pdf', content_type: 'application/pdf')
pdf.save!
