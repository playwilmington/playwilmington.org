if Setting.all.empty?
  Setting.create(
    company_name: "The Children's Museum of Wilmington",
    copyright: "Copyright &copy; 2016-2017 The Children's Museum of Wilmington
               All Rights Reserved"
  )
end
