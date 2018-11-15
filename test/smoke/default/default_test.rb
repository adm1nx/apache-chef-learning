describe command('curl http://localhost') do
  its(:stdout) { should match(/Welcome users/) }
end

describe command('curl http://localhost:8080') do
  its(:stdout) { should match(/Welcome admins/) }
end
