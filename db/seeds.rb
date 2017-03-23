# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{ name: "Rob B.", email: "robb@email.com", phone: "(416) 327-3682", title: "Assistant Deputy Minister Chief Administrative Officer", adm_office: true, adm: true, password_digest: "123456" },
  { name: 'Judi P.', email: "jp@email.com", phone: "(416) 326-7039", title: "Executive Assistant", adm_office: true, staff: true, password_digest: "123456" },
  { name: "Conn Car", email: "cc@email.com", phone: "(416) 325-6866", title: "Admin. Assistant", adm_office: true, staff: true, password_digest: "123456" },
  { name: "Nat R.", email: "natr@email.com", phone: "(416) 212-4215", title: "Events & Communications Coordinator", adm_office: true, staff: true, password_digest: "123456" },
  { name: "Nad Alj", email: "nad.alj@emailcom", phone: "(416) 906-5018", title: "Project Officer", adm_office: true, staff: true, password_digest: "123456" },
  { name: "Cat Gui", email: "cg@email.com", phone: "(416) 325-6828", title: "French Language Coordinator", adm_office: true, staff: true, password_digest: "123456" },
  { name: "Iso Kuzm", email: "isku@email.com", phone: "(416) 325-9366", title: "Exec. Lead, Transfer Payment Information", adm_office: true, staff: true, password_digest: "123456" }])
