class InitSuperUser < ActiveRecord::Migration[5.2]
  def change
    User.create(email: 'super_admin@admin.com', first_name: 'Super', last_name: 'Admin', password: '12345678', role: 'super_admin').confirm 
  end
end
