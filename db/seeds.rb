# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{ name: "Rob B.", email: "robb@email.com", phone: "(416) 327-3682", title: "Assistant Deputy Minister Chief Administrative Officer", adm_office: true, adm: true, password: "123456" },
  { name: 'Judi P.', email: "jp@email.com", phone: "(416) 326-7039", title: "Executive Assistant", adm_office: true, staff: true, password: "123456" },
  { name: "Conn Car", email: "cc@email.com", phone: "(416) 325-6866", title: "Admin. Assistant", adm_office: true, staff: true, password: "123456" },
  { name: "Nat R.", email: "natr@email.com", phone: "(416) 212-4215", title: "Events & Communications Coordinator", adm_office: true, staff: true, password: "123456" },
  { name: "Nad Alj", email: "nad.alj@emailcom", phone: "(416) 906-5018", title: "Project Officer", adm_office: true, staff: true, password: "123456" },
  { name: "Cat Gui", email: "cg@email.com", phone: "(416) 325-6828", title: "French Language Coordinator", adm_office: true, staff: true, password: "123456" },
  { name: "Iso Kuzm", email: "isku@email.com", phone: "(416) 325-9366", title: "Exec. Lead, Transfer Payment Information", adm_office: true, staff: true, password: "123456" },
  # HR
  { name: "Christi C.", email: "chrc@email.com", phone: "(416) 325-6599", title: "Director", strategic_human_resources: true, director: true, password: "123456" },
  { name: "Mich J.", email: "michj@email.com", phone: "(416) 325-6608", title: "Admin. Assistant", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "Anne Azz.", email: "anna@email.com", phone: "(416) 314-3823", title: "Manager (A)", strategic_human_resources: true, manager: true, password: "123456" },
  { name: "Nav Na.", email: "nn@email.com", phone: "(416) 326-2990", title: "Manager (A)", strategic_human_resources: true, manager: true, password: "123456" },
  { name: "Van P.", email: "vp@email.com", phone: "(416) 325-9943", title: "HR Projects Advisor", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "Rac F.", email: "rf@email.com", phone: "(416) 325-7598", title: "HR Business Advisor", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "Ji D.", email: "jd@email.com", phone: "(416) 325-3624", title: "HR Business Advisor", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "Gab Cam.", email: "gbc@email.com", phone: "(416) 212-4872", title: "HR Business Advisor", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "Yv Ch.", email: "yc@email.com", phone: "(416) 325-6873", title: "HR Business Advisor", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "Di Bri.", email: "db@email.com", phone: "(416) 212-3170", title: "Workforce Planner", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "Se Des.", email: "sd@email.com", phone: "(416) 325-7362", title: "Project Coordinator", strategic_human_resources: true, staff: true, password: "123456" },
  { name: "X Na.", email: "xn@email.com", phone: "(416) 326-7234", title: "HR Business Advisor", strategic_human_resources: true, staff: true, password: "123456" },
  #SMF
  { name: "Nel J.", email: "nj@email.com", phone: "(416) 314-3309", title: "Director", service_management_and_facilities: true, director: true, password: "123456" },
  { name: "Sur Dur.", email: "srdr@email.com", phone: "(416) 326-8381", title: "Financial and Admin. Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "P Res.", email: "pre@email.com", phone: "(416) 326-5826", title: "Emergency Management Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Jo Lare.", email: "jolo@email.com", phone: "(416) 212-6984", title: "Business Analyst", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Gi Co.", email: "gico@email.com", phone: "(416) 327-4818", title: "Emergency Management Assistant", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Al Be.", email: "alb@email.com", phone: "(416) 325-8776", title: "Manager, FOI, Privacy and Information Management", service_management_and_facilities: true, manager: true, password: "123456" },
  { name: "P Ca.", email: "pc@email.com", phone: "(416) 326-1344", title: "Tougas FOI Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Dal Bou.", email: "db@email.com", phone: "(416) 325-8899", title: "FOI Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Mi N.", email: "min@email.com", phone: "(416) 325-6156", title: "FOI and Information Management Analyst", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Pa El", email: "pe@email.com", phone: "(416) 212-0176", title: "Advisor, IM and Access Strategy (A)", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Jay T.", email: "jt@email.com", phone: "(416) 327-4824", title: "Freedom of Information Program Assistant (A)", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "C Pe.", email: "cp@email.com", phone: "(416) 325-6423", title: "Manager, Facilities and Service Management", service_management_and_facilities: true, manager: true, password: "123456" },
  { name: "M Z.", email: "mz@email.com", phone: "(416) 325-6451", title: "Facilities Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "L Lo.", email: "ll@email.com", phone: "(416) 326-8384", title: "Facilities Coordinator/ Business Analyst", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Ma A.", email: "ma@email.com", phone: "(416) 325-6467", title: "Security Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Rob C.", email: "rc@email.com", phone: "(416) 326-1762", title: "Security Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Ha T.", email: "ht@email.com", phone: "(416) 325-6570", title: "Business Analyst", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "K Tan.", email: "kt@email.com", phone: "(416) 212-0468", title: "Manager, OITC", service_management_and_facilities: true, manager: true, password: "123456" },
  { name: "Be V.", email: "bv@email.com", phone: "(416) 212-0465", title: "Client Relations Coordinator", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Mike N.", email: "miken.@email.com", phone: "(416) 212-0456", title: "Information Services Officer", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Ca Co.", email: "caco@email.com", phone: "(416) 313-3400", title: "Client Relations Assistant", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Am B.", email: "amb@email.com", phone: "(416) 313-3400", title: "Client Relations Assistant", service_management_and_facilities: true, staff: true, password: "123456" },
  { name: "Ra Ra.", email: "rr@email.com", phone: "(416) 313-3400", title: "Client Relations Representative", service_management_and_facilities: true, staff: true, password: "123456" }])
