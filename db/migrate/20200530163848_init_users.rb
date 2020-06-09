class InitUsers < ActiveRecord::Migration[5.2]
  def change
    User.create(email: 'qcls.davison@gmail.com', first_name: 'qcls', last_name: 'davison', password: '12345678', role: 'super_admin').confirm 
    User.create(email: 'admin@qishub.com', first_name: 'admin', last_name: 'qishub', password: '12345678', role: 'admin').confirm 
    User.create(email: 'david@qishub.com', first_name: 'david', last_name: 'qishub', password: '12345678', role: 'staff').confirm 
    User.create(email: 'individual@qishub.com', first_name: 'individual', last_name: 'qishub', password: '12345678', role: 'individual').confirm 
  end
end
