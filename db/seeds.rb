# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{ name: "Rob B.", email: "robb@email.com", phone: "(416) 327-3682", title: "Assistant Deputy Minister Chief Administrative Officer", adm_office: true, adm: true },
  { name: 'Judi P.', email: "jp@email.com", phone: "(416) 326-7039", title: "Executive Assistant", adm_office: true, staff: true },
  { name: "Conn Car", email: "cc@email.com", phone: "(416) 325-6866", title: "Admin. Assistant", adm_office: true, staff: true },
  { name: "Nat R.", email: "natr@email.com", phone: "(416) 212-4215", title: "Events & Communications Coordinator", adm_office: true, staff: true },
  { name: "Nad Alj", email: "nad.alj@emailcom", phone: "(416) 906-5018", adm_office: true, staff: true },
  { name: "Cat Gui", email: "cg@email.com", phone: "(416) 325-6828", adm_office: true, staff: true },
  { name: "Iso Kuzm", email: "isku@email.com", phone: "(416) 325-9366", adm_office: true, staff: true }])
