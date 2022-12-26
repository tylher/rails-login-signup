json.(user, :id, :usernamme, :email, :image, :bio)
json.token user.generate_jwt