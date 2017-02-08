def har_json(file_name)
  JSON.parse file_fixture(file_name).read
end
