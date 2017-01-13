require 'rails_helper'

feature 'User post correct post', %q{
  Пользователь отправляет Post
  Система проверяет существует ли пользователь и его пароль
  Пользователь существует, требуется проверить пароль и 
  Создается/несоздается Post и PostIP
} do
  
  given(:user) { create(:user) }
  given(:post) { create(:post) }
  
  # scenario 'Для корректного пароля и корректных данных' 
  
  # scenario 'Для корректного пароля и не корректных данных' 
  
end
