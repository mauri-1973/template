class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :profile_picture, :string   # URL de la imagen de perfil
    add_column :users, :name, :string              # Nombre completo
    add_column :users, :phone, :string             # Número de teléfono
    add_column :users, :role, :string, default: 'user' # Rol del usuario
  end
end
